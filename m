Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556083;
	b=C47Hia/0rEKfe/dMRAXFP5SZHVKKHZDzdoTKCXfhlElDDJ5fB5L4r2hHonoutrKeWpJ4
	 z6I6po4CN5z1dit/ApED8Pw4vwmXogGy18n3IZeSYFeOdMEQ/13Z2br9V2r/dm+GkMjW9
	 7kfWj+tfRG6z25YkubhQMfX/l5uyFTE+EcJ53JIw0k6cLH945cRU3CUfSSDNciz3/TTjY
	 BKY2V9cPYHn0Ii3e4vbNXxjWRI28xBD2pPArr/eXNX3HLauRTRzpDknfOr/9pYt/8/zhO
	 m1dqsJ+04mQhkvnYIm6QBe1IdlwSYH+ElStb4RYRD2ZTw1x+SPZcM9Drn5DXVX5lDHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PyyQwKmFe9iM2Cp50Hb1UepVeU0i/+dyb3nhRaBGF3U=;
	b=dBqLaVArvDHJb7bilepW/2y4V435Z4IGQPO3zogbd8kYWk6vDdMyEj0f0NBi4Df/J5+o
	 pT57qvVq4BRKrDdmjErW4cULBaZSojnRtoCVT5MaK/UiSifr9NprxB95FgM7JhYYZ4Lol
	 lKDnuPMPkIGeSBOlCRe5kK2JAQ6brukt/lhO7SaJOQn7LvzIbpTSCoXg2JCJzzQHorZkk
	 K/LUlNxhgcmZAOKTtpGjLIjicYpgzzeHp3CwokE97olK0XuJ+NzYF8oMxg70rzxasUpW8
	 SuHsezr7ntj3qWa6Fi3o96Ovjugz9ke3rOeaX8znVQVMqJkFCxKv2rtWOGrWyzy2CYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AB/zvdsC";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BC8606A327
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 21:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22BC8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AB/zvdsC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so54667225e9.0
        for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 13:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556081; x=1796160881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PyyQwKmFe9iM2Cp50Hb1UepVeU0i/+dyb3nhRaBGF3U=;
        b=AB/zvdsCM+6H4QDdZf4VqmpZlY76/AGtab3B6AhJ6/WIjjqp0XwoTiQGpzR7gyExmc
         0xYDZhpMQSgpOOPK65ofwo1NUa8gTOScQ3eb9gNt/RvJmdVSckeF+dBbVOIenJ9MB09Z
         F0aeEqjDU3eeVnzxCN6l2ZXtORhg6cDFlRumWdmCn7uqYC+Oko3rYDtcA7ysJ6Yf/Oiu
         5h0s4Dql0GHvWCVqPBSbIJX3HznZyjNAD4ERuA8hbm+BkGSl7LmXvUfhdGrQ/3uYXmOZ
         UcF4igOfwNuioBMvAuokNzaOHdvM22ug0u57tpktsPjG4PwrRWUdzeKbs4bbQhq9ZI91
         WFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556081; x=1796160881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyyQwKmFe9iM2Cp50Hb1UepVeU0i/+dyb3nhRaBGF3U=;
        b=xjkYf84txWQHzkoBwF8q1Vix/TkzPco2OIgLAiBP3Ce1Wzk1exOdb81TuV1zbyhTi3
         8JfeWY4ZEqhj0wnTWcwDYWZtnLTWvDWCMEN4XTZpIwawz1Z0twdw3XkHmscFZqb81J4B
         JU7WJcUR0iH1i4MAWF8Wb3W3uE2QVPaYIbWqAn6vmrCEaRWhM4rBl/lY91FZeYLxmm/q
         HJO9NEOLbJkqDGct9ajcRhfoQfC3l8+Lp8vHZWM6Bp0fRLgygB92sw21gFt9mTrU4rNA
         ixDkS3lRlwdHWVoqtn63dbiehHgN2BqC/gFQJfPFSfFW8/Am7p+cnCqMyw70wy8QALTS
         qPFQ==
X-Forwarded-Encrypted: i=1; AL+hErE20QAM9PzhKdIczMmvwu2p+70p36haqg4nJ53o7e3eX6E3H7A8mG2aPQqSB3DCFekvkr9KXXX507gvgw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8sj9c3IHgFX+UB+mj9yiu4IuPiLkFKVle4TRPgMUyuMmc2Ty81
	BrYWkW2PgEvMHBg8dBvtpxa9RN4OuIXcOeNA+348Z6vixV3YpOgR11/p
X-Gm-Gg: AZFdTZedFFaWhMHx+DuttOfvxlBPhmR8cnDk6mIFlqOdVYLdUK2zSIMeo5pTcOirLEb
	slJqnfhFEuuFyAx6cAPmiQxUtVRZv4eC3SaYrB7uM4lelQQyg/AnYi6afAn0RnczBWLqufy8oNC
	hJcfBek7GLryIIz6mHuIqT05jg17tFYGIp/G4/qw4A0xBEst0BTmZ8XFrFM9tl+0qN2mi37OrqY
	LEIrrR4M6PgkE40RDLyoeS3HPI/VIu6vmwdV+RekU6Tx4RbRLjga0pt0OWvISDGmETi4hqYhT+A
	x1/DhB0s46debdDlAzIi8S56h57R6Ekjpx8eSCZXR9aBjz3tPAxIr1dU8gkEXfPYp3tmX1ALT+H
	KBLriDneC1keGCho52kg+vHoTQLej2o5qnAadxtqxFyjxrbZYi/SGyDUCsO1AwmNNrbwgX726rG
	Jrr5AQmh+u8swK6+4eRGhFiwFWy3CoVxyQZCBTZt699jQGTq1KiugH1LKVZvDgklmZ28HQAOMIe
	lDMQhCiWSpMTOLhUSsWhXisOUSKIQJAuZwFnZcqQOMZnFM0qkni+42pqhF76rJ0DePsXSCouO/q
	qILWonNxzTAQJmNRn+Pk5jkDm/6kBA==
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr328897525e9.19.1795556081300;
        Tue, 24 Nov 2026 13:34:41 -0800 (PST)
Received: from fra-x8664 ([151.83.244.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm403974515e9.2.2026.11.24.13.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:34:40 -0800 (PST)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ilia Mirkin <imirkin@alum.mit.edu>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] drm/nouveau/devinit/gf100-: fix POST being skipped on GPUs without display
Date: Tue, 24 Nov 2026 22:34:30 +0100
Message-ID: <20261124213430.9525-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2139cb633d48 ("drm/nouveau/devinit/gf100-: try to avoid
double-running vbios scripts") skips devinit if VGA CRTC register 0x00
or 0x1a is non-zero, unless the display engine is disabled.  It detects
the latter from the return value of nvkm_devinit_disable(), which is
always 0: the strapped-off engines are removed with
nvkm_subdev_disable() instead.  So the VGA registers are always read.

On a GM108 (GeForce 940MX: no display engine, not POSTed by the
firmware) those reads fault and return 0x13.  devinit is skipped, the
GPU is used uninitialised and the machine panics at boot:

  nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 00000000001a1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 04 [UNBOUND_INST_BLOCK] on channel -1
  mce: CPUs not responding to MCE broadcast (may include false positives): 1,3
  Kernel panic - not syncing: Timeout: Not all CPUs entered broadcast exception handler

Check device->disp instead, once nvkm_devinit_disable() has removed the
disabled engines, like nv50_devinit_preinit() does.

Fixes: 2139cb633d48 ("drm/nouveau/devinit/gf100-: try to avoid double-running vbios scripts")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---

Notes:
    v7.3.4 boots on this machine; v7.3.5, which has the stable backport
    (992f7f5f34f8), panics.  Tested on v7.3.5: with this patch the GM108 is
    POSTed again at probe and on runtime resume.  Not tested on a board
    that has a display engine.
    
    Read at preinit on this board: 0x2240c = 0x00000000, CR00 = CR1A = 0x13,
    0x021c04 = 0x00000001 (display strapped off).
    
    The regression was analysed and the patch drafted with an AI coding
    assistant (Claude Code); I tested it on the hardware above.

 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
index 186e09ea0c..b256404c24 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
@@ -107,12 +107,12 @@ gf100_devinit_preinit(struct nvkm_devinit *base)
 	 * VBIOS multiple times may have detrimental effects.
 	 */
 	if (base->post) {
-		u64 disable = nvkm_devinit_disable(base);
+		nvkm_devinit_disable(base);
 		/* magic to detect whether or not x86 vbios code has
 		 * executed the devinit scripts to initialise the
 		 * board. only works if there's a display engine.
 		 */
-		if (!(disable & (1ULL << NVKM_ENGINE_DISP))) {
+		if (device->disp) {
 			if (nvkm_rdvgac(device, 0, 0x00) ||
 			    nvkm_rdvgac(device, 0, 0x1a)) {
 				base->post = false;

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.56.1

