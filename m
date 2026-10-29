Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267240;
	b=SQZGIIdfNdJrzg+ssT+DTwIxk0ulrqrQacLz7n4F6yN0E61plhDqm4UbZv6P6S8EQDEx
	 v1VwyxrWV5eqD20/UBsRDZbmfwu3Q+9jIvTvIKBb0rzD1EVJQz5Q+bWu3IfAfi3wQnwBT
	 tznViRQeTvXEmIczobUYtrlbuJEmHD1jIvN5KQnJerymqVWi+0J1qatlqTfoUGSHo5iuP
	 iF+t8J/B2Y0LACduJdRyNMIFnEwiv5tbm/4lp4ZpC1ZklS6F1LTK8AdxItaYsPXoJhiXc
	 +k/5huIylRAzukKChEZjQAvn6LhCGQ+EpqeOiSgSe732CRm4fu1rD+23/PsxY3ZoDDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ln7ETxCnDGUOhcBIhAMeXSU0zs0khHi7wfl/J1q2waY=;
	b=dxGoUSHIXJnXtNu/HaJeCXqbHykiG7DMyYPhixdu50FQmBJU9ogMqdI8oOcWwlxVo+BP
	 8vi/q+ItfF/IZuDZDPQOcUZGpZxeDdpoaw1UV2OdBYkeUcQlNLOly4UH0a8cT8c6H/yTW
	 ZNJLJ/kZHhngEoiJqWjs7jUNjxqvXj3ZmztRwGq0l2ptYdhSW0eWkF6ZCdvP5Dv4VT6cE
	 CG7dvC54ZupGMCJFAlapK2Vzar45nQjdRaitx4a7GyEWypXmvBoYNHqQKWuQu8dJJdZ+g
	 rDg3uNSXJ/33wGW5DJA1FgU7xhv8Eg8KtHt4wFaApuPSOve8xUwndIWkIajJbJ7kN+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma6mMbWu;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDF4606A322
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 09:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEDF4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma6mMbWu
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2403058eec.1
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267239; x=1793872039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ln7ETxCnDGUOhcBIhAMeXSU0zs0khHi7wfl/J1q2waY=;
        b=ma6mMbWuOGKIhwn/Cj9IbKRoAimpPQyOWVQ1ipTh1+tLhgnRkiJPJtbKMPJ4jkiBd6
         hxCr06bRF4A8vK0MY1bxYsgp/hwt2jbdpuUZqPK7n1Z6FECjLX+NWqipG2G6hgV11Aod
         kZ/w7AU8mBy6X2zMoa/RPN4tvd5i6x6KL5RA/OKwrFCFK2unQgUlY+WXuubUB9+bEu3I
         nESIxq3FuVYtLFOXIm/bbd3TSot1etUB3tkryHIUVO+pQ8iOVoS2u8+pU/MRA1prikkk
         IxIla8BksVeIg2Ac73wbuFQ9IK4hMzW0ipm8Fhr4NCn92UKpeM4PFC2VQLRO0CdGiy+3
         g5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267239; x=1793872039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ln7ETxCnDGUOhcBIhAMeXSU0zs0khHi7wfl/J1q2waY=;
        b=mEY0BfSfTNfFSGHTZmJrIemUHgTMLRJ4loHPNgQHdhvk+8KbyK50NhuaM/qzOC8w5A
         vbzH/ntc/gaE6mRhGS6rkZvoiuySPTiB7LSvoDSeJrByDtjBS/BcShQ1Kycn11QDnVuI
         HRo6HDVsg25qmVk72shpCuHUu20kOHM3//q2A7iwDRynGG5YJNo5P6CmJSBYocH8b0Us
         nEFhNJZrVSziNY279zdlVg9BsMgmoBL/TVLJwh0Owgvj8gVOBinZmiHWYeiHVGMqC63y
         blbqt3Y+FU8iTWK5IwfyIrqnICIpIzDWJSp+9k1yGq+mpmArLMaQUB5XBFB2CJ7RsO4K
         9USg==
X-Forwarded-Encrypted: i=1; AKwUvBxz/esgDKfs5BZw0a6FG55Ol16zoGomvuuogOOarycbW7IrrqgBpP9gLb8M1wVgl1s921NdjYJFKRWa8Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYK16Rs+WkDvmJOL4B19lSSw77LnC3WgpNCE5FOiG5c9C4UtczCr
	XYwNLwqBSLRzsiYwxYU9FBjufoTjqzb2XAKDrYnCMmWv5nfXzpOvqH7n
X-Gm-Gg: AYBFou2SwQWnZjt/FhDKqaSjbd2Pi53ursxMz4/1Ze+9PJyKOFcmBOLCG6VEDVw13UQ
	2v24VZ0KS4C/UT29mNZ7elSlc5vdlG2H4tiptdg2SaI7Mjha/9DMcUC80/716okHtDQKPRf60U9
	L6pp8CBkcX7ETDI8nrYXkpggMXHSLLERgReSNHPhk+fqzas5aRH97xnCM07PtYYpVpAPI5Kd0wT
	y2fW1KO96Du4alpZ6yE0DAE2fr8mex2Lt+dGFPWpSNBnfLUGuiJ0N435Grcr6eV3OUG5I7wBIEH
	LtryuGY/2yLekUSUXvTK215wMKaeR5VNQ5XDj2VBlBk/kg3Ow36derNfwxtbu0feVJeYaFr9pPa
	m4wwpEtx+OdXhjrULQEdGA6v+f5ecc1l0fMCBTlSOYYcuNMuOLHuYEZJpJY3Wfyk0e1Aefi9GT5
	wD2ViWK9/UL3PckNir3BQ9KdVw2t7o8TuyTjfw8h5BkoZAVMZ2s4bU5gIUoq9oSNZmC/PpSHmlK
	kjxPZEBBtIKiCkghc19dbaWfg6wCXKE5+vUuKJNn2ekdzzZSpmGC7AIowfBG0PT59ld4XqXcvB7
	rVDfgAmGJvWER65aAg4SjvGB4CzW4RNl+CGpvnjmog==
X-Received: by 2002:a05:7300:d80e:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a1ff846e3mr7012686eec.1.1793267238675;
        Thu, 29 Oct 2026 02:47:18 -0700 (PDT)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bc445sm14464245eec.1.2026.10.29.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:47:18 -0700 (PDT)
From: Challvy Tee <challvy.tee@gmail.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	dave.hansen@linux.intel.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	vishal.l.verma@intel.com,
	kai.huang@intel.com,
	Challvy Tee <challvy.tee@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is not initialized
Date: Thu, 29 Oct 2026 17:47:05 +0800
Message-ID: <20261029094705.896693-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261029080731.890996-1-challvy.tee@gmail.com>
References: <20261029080731.890996-1-challvy.tee@gmail.com>
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

Commit 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and
kdump") made native_machine_crash_shutdown() call tdx_sys_disable(), but
tdx_sys_disable() has no runtime gate: its only guard is compile time
(CONFIG_INTEL_TDX_HOST), which is enabled in most kernel configs.  On a
system where the TDX module was never initialized, kdump now issues a
TDH.SYS.DISABLE SEAMCALL that it did not issue before, and the crash
path never reaches machine_kexec().  The capture kernel is never entered
and no vmcore is written, so kdump is completely non-functional.

Having the TDX module uninitialized is an ordinary state rather than an
error.  tdx_enable() returns -ENODEV early when
X86_FEATURE_TDX_HOST_PLATFORM is absent, and it also bails out if
init_tdx_module() fails.  Any guest whose host does not expose TDX is in
this state and logs:

  virt/tdx: TDX not supported by the host platform

The syscore path is implicitly protected: register_syscore() only runs
after init_tdx_module() succeeds, so tdx_shutdown() cannot be reached on
an uninitialized system.  That is why plain kexec still works and only
kdump regressed.

The crash path calls tdx_sys_disable() directly and bypasses that
protection.

Reproduced with 'echo c > /proc/sysrq-trigger' in VM guests on Intel
Sapphire Rapids, Emerald Rapids and Granite Rapids platforms, in every
case on a kernel that already contains the change described above: the
capture kernel is never entered and no vmcore is produced.  With this
patch applied kdump completes normally on all of them.

Three negative controls, all of which produce a vmcore as expected: the
same guests on kernels without that change, guests on platforms without
SEAM support, and plain kexec on every platform tested.

On a host where the module did initialize the new gate is a no-op and
TDH.SYS.DISABLE is still issued, so the poison clearing that the above
commit was added for is unaffected.  We do not have a TDX host to test
on, so this part is reasoned from the code rather than measured.

Gate the SEAMCALL on tdx_module_state.initialized, the same predicate
tdx_get_sysinfo() already uses in this file.  Putting the check inside
tdx_sys_disable() rather than at the crash.c call site also covers the
syscore caller and any future caller.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v1 -> v2:
 - Use the real commit id 5b25f249be32 in the Fixes: tag and in the
   opening paragraph; v1 went out with a placeholder instead.
 - Drop the claim that nothing reaches the console.  panic() prints the
   message and backtrace before __crash_kexec(), so they do appear;
   describe the failure as the crash path never reaching machine_kexec()
   instead.
 - Drop the paragraph that explained why guests on platforms without
   SEAM support are unaffected.  It asserted a mechanism we have not
   verified, and the negative controls now carry the same information.
 - State explicitly that a host where the module did initialize is
   unaffected, so the poison clearing the fixed commit was added for
   still happens, and say plainly that we have no TDX host to test on.
 - Restrict the syscore claim to kexec: tdx_suspend() does not call
   tdx_sys_disable().
 - Resend with the full get_maintainer.pl recipient list.  v1 only
   reached stable@ and missed LKML and the x86 maintainers entirely.
   v1: https://lore.kernel.org/all/20261029080731.890996-1-challvy.tee@gmail.com/
 - No code change.
 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..a7eae7492c1e 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!tdx_module_state.initialized)
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

