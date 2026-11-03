Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672221;
	b=hk6nAOY4eLlSe04ctyBOOFcpptc4N3bl9ljVtfJNk53j1kg15IF0AgrxfP7GFHKfs4sV
	 e8le6On4C9w/4MCftmJwt35TYkBAJQ/DUuab8tFySH8uDvGbOJ5/nb2Rg2kUmHd1kqQP+
	 dX9LztAbHG3YdCf0q/k/CwqbwH/WIDZULEwpVxExRjojB3UCS3TKwDKD3v12ZpbtkyCbN
	 Htdwgpt7681YZwbkcaFP0zmvqSX/tbu5C7okDVDyz+NATz/kA6vG21QlGpPLvYiHRAZFW
	 rN1ubL02xm5ZSAKdqNnBmqjff/e7O8AnBo2kP0jj6OjPJ/doEA91kn+UeTlb4QYarVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IOGgt4lAkAMwt4N6sT0llhti/KNul9J7tc5dogJ2lwc=;
	b=GvWhR+NNQxn1VilbufvorZ5ea6oKM2Yi9AgJEwRDSDZNsh8MVHEiqHpeGgU5Ib3GfOG0
	 B+UoGmwRYxvcOfp5A0nvdvFf9mMIK3lXFmVEuAmtux2VZrsi2A2F0LJHCLepzEOpoHUQJ
	 MKuA6KCNGE5kNc7e096NfVdRWi4OQshV802J5CLApAZ/Di2XVQhS2ZWgTMzHoSseycL+r
	 2OX7KypJXreCtsdRRr3Cd0wyxr7EIh7gfdjFE3IOXRlu8WbvkjcAaVvXIgaG+froymU1U
	 AKo9hFqky4DfAL5MWsxb1G8xg/+8Svq/pQZQpBpwQvDXq8yvDcMhqYCjpkCE/C+bDfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtv1XhB6;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766D4606A32C
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 02:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 766D4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtv1XhB6
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06c60065fso2544673b3a.1
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 18:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672221; x=1794277021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOGgt4lAkAMwt4N6sT0llhti/KNul9J7tc5dogJ2lwc=;
        b=jtv1XhB6Mtiedz+uSY+B7vauO+un5UHrrC75CMpD16Eh+J5wsX3jq7Z8V3uzplreht
         JYBYdfaN1SAGAPOZcXqHwe7Qnj6+nSHGz3yf/IqF+RWrcl9S7Aaa+s34B1VPoiuhtj1z
         kpIaIaOww4mfnEH8kpJe5L+BeDd7f5Za8B5a7EYyzgQXNxMAwdpUHt107y6C1surZpLG
         nG9/wsySr6zxeTzxlOr/A933+29aPlVTqi83fPr2z5higDqAGPv4Tzsi+EgQdBd/8lNE
         yDKCu7aQvedsWfx5p94P3YIFmgOE1UznWjvRWKhED4uXllrOOclAK7DWYx4PJbOGXRd7
         kijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672221; x=1794277021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOGgt4lAkAMwt4N6sT0llhti/KNul9J7tc5dogJ2lwc=;
        b=LTxTyYCNftemb/nwZPaVimuhygtYD6ArFVtOhtblsp2U28mNz6101JSmWyGf44Btzx
         Iccy9pGk48MzctwLnngIAJ5lVfGrmuFAjdHgdLkrncmNPvnFpNf78kIfs3TflXKrfglb
         5nPVgDoYsGt76Mb65ZqgVhMubQr5FFWEOZ/iaxDdWgYLAnv0v6jNU9fmcIwEnRJwBIhb
         zzjRsn/ZT7tylqGSTOqlHWA4XFOhjFGK9uaURCXfcfU1Zpd3oO7cqHF9Ey20fAcOHGkO
         binztB3UTQywLmiTASxZhLCaicZ8+IJbphij0kzYwm33O0iLVm9h3CVncEo+5jBVCp/k
         zJsg==
X-Forwarded-Encrypted: i=1; AKwUvBz2jyS025XCn4Se2nSCt61hfrRzr5XQB/r/5T1zqEfl8df6HaX1ucde889+Fagzh0tLS5BopyiBJlK+oA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9o3Ozbnbin6D1c+SG55u+j65+Dz+bwhdVd7p8TReswikQV5tZB
	OBYdrapgT2YqGygL1dL3ih8/LweIjhc6AvP7NDpniiYuhEguiOTWvZLM
X-Gm-Gg: AYBFou27NSTAf0n/cFvv+eN9907ykFXjC1q9TCrRGjlcQ77F5Otk4GFd2mq1ftaTnAu
	nvt5w4HbfZcll1gO8OIelVkAQ66UhSO/3S9GTWAg7OYv4NNWtdkpyCB6GJIl3VOqMi/yfZS2aXY
	eNQmyIVaWnuMtoVp1CBZnbr+qaYdg5OhN+dST2tEmVn+Arla1AdzbmiLtgvjTVz8f2FZD3XZYaS
	a+QSor0EkYxXGnewJG9AC6FSCt6+Lf49oZSSwhdjH9xY6/8HJ6qZ0IuH1sT/YlBBIxNQ7DKN77S
	AQOJMnWrRb0QYDsTOrMEGPvGjLpD0WucSCUxnbYjStwKlNtCzkybpuouEq3Qd4TjuwlMi+5+4G/
	Fo7donZg3LXzx3l5P2xUEIRkAt0GqugmofSnGGb0y6nrNheHmftEmV374ZiRobu0cm02DuKFzvl
	70UlNQkjxigd2EOmagTkz7UkkvpG3eUuunUQgAYcIFYVhEHZjQTpMCjDM3DNpsCC53gRpEyvmGR
	BTZeSOy0rDkNsRd2EOUAoRZSNGhrLYJiTfvManlA0PYlVek/XI2zSZ/5ozhYujhTs2s6fjrx3b+
	ToX+ry4dh6z+HiTVulHWI1KqYDp5+U97gEmmI3Y8Ync=
X-Received: by 2002:a05:6a21:3b49:b0:3e1:d379:f3b3 with SMTP id adf61e73a8af0-3e928fe8569mr7948733637.77.1793672220726;
        Mon, 02 Nov 2026 18:17:00 -0800 (PST)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36448182sm490457a12.6.2026.11.02.18.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:17:00 -0800 (PST)
From: Challvy Tee <challvy.tee@gmail.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com,
	vishal.l.verma@intel.com,
	kai.huang@intel.com,
	seanjc@google.com
Subject: [PATCH v5] x86/virt/tdx: Gate TDH.SYS.DISABLE on X86_FEATURE_TDX_HOST_PLATFORM
Date: Tue,  3 Nov 2026 10:16:50 +0800
Message-ID: <20261103021650.924302-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <09c311c6aae214c04a9a55ff6456d7abfe82c319.camel@intel.com>
References: <09c311c6aae214c04a9a55ff6456d7abfe82c319.camel@intel.com>
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
kdump") made native_machine_crash_shutdown() call tdx_sys_disable(),
whose only gate is compile time (CONFIG_INTEL_TDX_HOST).  A kernel that
never initialized the TDX module therefore still issues
TDH.SYS.DISABLE.

In VMX non-root operation on a SEAM-capable host, SEAMCALL causes a VM
exit instead of a native #UD.  KVM injects #UD only since
commit 9d7dfb95da2c ("KVM: VMX: Inject #UD if guest tries to execute
SEAMCALL or TDCALL"), first released in v6.18.  On an older host the
VMM gets KVM_EXIT_INTERNAL_ERROR and the vCPU never resumes, so
machine_kexec() is never reached and no vmcore is written.  Kdump is
thus broken only in guests on SEAM-capable hosts whose hypervisor does
not handle the exit; plain kexec is unaffected because tdx_shutdown()
only runs as a syscore op, registered after init_tdx_module() succeeds.

Gate the SEAMCALL on X86_FEATURE_TDX_HOST_PLATFORM before issuing it,
the way paddr_is_tdx_private() already guards its own SEAMCALL in this
file.  Without that feature the module is never initialized, so there
is nothing to disable; on a TDX host the gate is a no-op.

It also decouples kdump from the host KVM version -- a guest cannot
require its host to inject the #UD.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Vishal Verma <vishal.l.verma@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v4 -> v5:
 - Update the subject to name the X86_FEATURE_TDX_HOST_PLATFORM check,
   as requested in review.  No code change.
 - Add the Reviewed-by tags collected on v4.

The reproduction data and the host-side KVM log are unchanged from v4:
https://lore.kernel.org/all/20261102073244.919864-1-challvy.tee@gmail.com/

 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..9b01131f7b7b 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!boot_cpu_has(X86_FEATURE_TDX_HOST_PLATFORM))
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

