<template>
  <div class="login-page">
    <div class="login-shell-copy">
      <span>FAST RETAIL OPS</span>
      <strong>鲜活到店，即刻履约</strong>
      <p>商品、订单、门店状态和经营数据，一屏进入。</p>
    </div>
    <div class="login-card">
      <div class="login-left">
        <div class="slide-container">
          <div class="slide-item">
            <img src="@/assets/login/图1水果.png" alt="水果">
          </div>
          <div class="slide-item">
            <img src="@/assets/login/图2零食.png" alt="零食">
          </div>
          <div class="slide-item">
            <img src="@/assets/login/图3蔬菜.png" alt="蔬菜">
          </div>
        </div>
      </div>

      <div class="login-right">
        <div class="login-form-wrapper">
          <div class="form-logo brand-lockup">
            <span class="brand-badge">未</span>
            <div class="brand-text">
              <strong>未来超市</strong>
              <em>管理工作台</em>
            </div>
          </div>

          <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">
            <el-form-item prop="username">
              <el-input
                v-model="loginForm.username"
                placeholder="请输入账号"
                prefix-icon="iconfont icon-user"
                class="form-input"
                auto-complete="off"
              />
            </el-form-item>

            <el-form-item prop="password">
              <el-input
                v-model="loginForm.password"
                type="password"
                placeholder="请输入密码"
                prefix-icon="iconfont icon-lock"
                class="form-input"
                @keyup.enter.native="handleLogin"
              />
            </el-form-item>

            <el-form-item>
              <el-button
                :loading="loading"
                type="primary"
                class="login-submit-btn"
                @click.native.prevent="handleLogin"
              >
                <span v-if="!loading">登录</span>
                <span v-else>登录中...</span>
              </el-button>
            </el-form-item>
          </el-form>

          <div class="login-footer">
            <a @click="showAbout = true">关于我们</a>
            <span class="divider">|</span>
            <a @click="showContact = true">联系我们</a>
          </div>
        </div>
      </div>
    </div>

    <el-dialog
      title="关于我们"
      :visible.sync="showAbout"
      width="500px"
      custom-class="mt-dialog"
      :close-on-click-modal="false"
    >
      <div class="dialog-content">
        <p>未来超市是美团小象超市旗下线上综合超市服务平台，专注为用户提供生鲜、日用百货等商品的极速配送服务。</p>
        <p>我们坚持品质优先、服务至上，让您足不出户，享受便捷、安心的购物体验。</p>
      </div>
    </el-dialog>

    <el-dialog
      title="联系我们"
      :visible.sync="showContact"
      width="500px"
      custom-class="mt-dialog"
      :close-on-click-modal="false"
    >
      <div class="dialog-content">
        <p><strong>客服电话：</strong>12345678910</p>
        <p><strong>经理：</strong>张小虎</p>
        <p><strong>工作时间：</strong>周一至周日 8:00-22:00</p>
      </div>
    </el-dialog>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import { Form as ElForm } from 'element-ui'
import { UserModule } from '@/store/modules/user'

@Component({
  name: 'Login'
})
export default class extends Vue {
  showAbout = false
  showContact = false
  loading = false
  loginForm = {
    username: 'admin',
    password: '123456'
  }
  loginRules = {
    username: [{ required: true, message: '请输入账号', trigger: 'blur' }],
    password: [{ required: true, message: '请输入密码', trigger: 'blur' }, { min: 6, message: '密码长度至少6位', trigger: 'blur' }]
  }

  async handleLogin() {
    const form = this.$refs.loginForm as ElForm
    await form.validate(async (valid) => {
      if (!valid) return
      this.loading = true
      try {
        const res = await UserModule.Login(this.loginForm)
        if (String(res.code) === '1') {
          this.$router.push('/')
        }
      } catch (err) {
      } finally {
        this.loading = false
      }
    })
  }
}
</script>

<style lang="scss" scoped>
.login-page {
  width: 100%;
  height: 100vh;
  background:
    radial-gradient(circle at 18% 18%, rgba(255, 210, 46, 0.5), transparent 22%),
    radial-gradient(circle at 80% 70%, rgba(22, 193, 114, 0.2), transparent 26%),
    linear-gradient(135deg, #f9ffe7 0%, #eaf8d8 42%, #fff4c2 100%);
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: "Avenir Next", "Helvetica Neue", "Microsoft YaHei", sans-serif;
  position: relative;
  overflow: hidden;
}
.login-page::before {
  content: "";
  position: absolute;
  inset: 34px;
  border: 1px solid rgba(23, 33, 27, 0.08);
  border-radius: 28px;
  pointer-events: none;
}
.login-shell-copy {
  position: absolute;
  left: 72px;
  top: 24px;
  color: #17211b;
  z-index: 3;
  span {
    display: inline-block;
    padding: 7px 12px;
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.68);
    color: #16a66a;
    font-size: 12px;
    font-weight: 800;
    letter-spacing: 1px;
  }
  strong {
    display: block;
    margin-top: 6px;
    font-size: 22px;
    line-height: 28px;
  }
  p {
    display: none;
    margin-top: 6px;
    color: #5f6b5b;
    font-size: 15px;
  }
}

.login-card {
  width: 1040px;
  height: 560px;
  background: rgba(255, 255, 255, 0.82);
  border-radius: 28px;
  box-shadow: 0 28px 70px rgba(51, 87, 37, 0.18);
  display: flex;
  overflow: hidden;
  border: 1px solid rgba(255, 255, 255, 0.74);
  backdrop-filter: blur(14px);
  position: relative;
  z-index: 2;
}

/* 左侧轮播 - 全屏+无BUG版 */
.login-left {
  width: 58%;
  position: relative;
  overflow: hidden;
  background: #ffd22e;
}
.login-left::after {
  content: "今日鲜货";
  position: absolute;
  left: 28px;
  bottom: 28px;
  padding: 10px 16px;
  border-radius: 999px;
  color: #17211b;
  background: rgba(255, 255, 255, 0.78);
  font-size: 15px;
  font-weight: 800;
  box-shadow: 0 12px 30px rgba(23, 33, 27, 0.18);
}
.slide-container {
  width: 100%;
  height: 100%;
  position: relative;
}
.slide-item {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
  animation: slideAnimation 6s infinite;
}
.slide-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transform: scale(1.03);
}
.slide-item:nth-child(1) {
  animation-delay: 0s;
}
.slide-item:nth-child(2) {
  animation-delay: 2s;
}
.slide-item:nth-child(3) {
  animation-delay: 4s;
}
@keyframes slideAnimation {
  0% { opacity: 0; }
  15% { opacity: 1; }
  85% { opacity: 1; }
  100% { opacity: 0; }
}

/* 右侧表单 */
.login-right {
  width: 42%;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 52px;
  background:
    linear-gradient(180deg, rgba(255, 255, 255, 0.96), rgba(252, 255, 244, 0.96));
}
.login-form-wrapper {
  width: 100%;
  max-width: 320px;
}
.form-logo {
  text-align: left;
  margin-bottom: 36px;
}
.brand-lockup {
  display: flex;
  align-items: center;
  gap: 14px;
}
.brand-badge {
  width: 54px;
  height: 54px;
  border-radius: 18px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(145deg, #102219 0%, #203b29 100%);
  color: #ffd22e;
  font-size: 28px;
  font-weight: 900;
  box-shadow: 0 14px 28px rgba(16, 34, 25, 0.18);
}
.brand-text {
  display: flex;
  flex-direction: column;
  strong {
    color: #17211b;
    font-size: 34px;
    line-height: 38px;
    font-weight: 900;
  }
  em {
    margin-top: 6px;
    color: #16a66a;
    font-size: 14px;
    font-style: normal;
    font-weight: 800;
    letter-spacing: 2px;
  }
}

.login-form {
  width: 100%;
}
.form-input {
  height: 48px;
  border-radius: 14px;
  border: 1px solid #e2eadc;
  transition: border-color 0.3s;
  &:focus {
    border-color: #ffc200;
    box-shadow: 0 0 0 2px rgba(255, 194, 0, 0.1);
  }
  ::placeholder {
    color: #c9cdd4;
  }
}
.el-form-item {
  margin-bottom: 24px;
}

.login-submit-btn {
  width: 100%;
  height: 48px;
  border-radius: 16px;
  font-size: 16px;
  font-weight: 800;
  background: linear-gradient(135deg, #ffd22e 0%, #ffae1f 100%);
  border: none;
  color: #17211b;
  transition: all 0.3s;
  &:hover {
    background: linear-gradient(135deg, #ffe16a 0%, #ffb52b 100%);
    color: #17211b;
    box-shadow: 0 12px 24px rgba(255, 178, 32, 0.34);
    transform: translateY(-1px);
  }
}

.login-footer {
  margin-top: 30px;
  text-align: center;
  font-size: 14px;
  color: #86909c;
  a {
    color: #4e5969;
    cursor: pointer;
    padding: 0 8px;
    transition: color 0.3s;
    &:hover {
      color: #ffc200;
    }
  }
  .divider {
    color: #c9cdd4;
    padding: 0 4px;
  }
}

.mt-dialog {
  .el-dialog__header {
    border-bottom: 1px solid #f0f0f0;
    padding: 16px 24px;
    .el-dialog__title {
      font-size: 18px;
      font-weight: 500;
      color: #1d2129;
    }
  }
  .el-dialog__body {
    padding: 24px;
    font-size: 14px;
    color: #4e5969;
    line-height: 1.8;
    p {
      margin-bottom: 12px;
    }
  }
}
</style>
