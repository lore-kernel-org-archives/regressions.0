Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BC313DDAE
	for <regressions@lists.linux.dev>; Sat, 14 Feb 2026 01:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771034346; cv=none; b=Ime+eqH/VMHYIxxH2seMWhB3H7LD3qIRFdbmKnV+oHWBNnCFYZqgzDikv1ljD2D/gxJN4Qg5UAxYqOBzpUc9jSEe4VSNSUIg0zM7jEVtPytxTLUu5hJSAK02Xs3GLQG4PLbsIFdXvxJJDVboLMfkAxSkaXPLwa5f5x6Qx3jlEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771034346; c=relaxed/simple;
	bh=U70jkWYNuOW5GtIZ4h0Ej0ry7ecHACUK1uG5EL4lANs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Q5XJCsnYUOHa42yOod8/scWkSfapHCk6mZt9NlPl398qDVY7s52zhlfx6lnZFW3RS1sExPZNu2b148b7dIfgGsN6zwoMuT3XgEnoSE2GasyEuoDlW0ghXC4m7xUfLvI5wNrnu6KthhW7c8SIl+76I+QlQtf9urW3dK1bPSatuTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=sVolC47H; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="sVolC47H"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2ba68df3687so2484589eec.1
        for <regressions@lists.linux.dev>; Fri, 13 Feb 2026 17:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771034344; x=1771639144; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6ds8ivclhd7/0EdtafyN3E0gV9x1foWSmGde/wizf4=;
        b=sVolC47HqPrjgn/KAG2nyg7NwfpQLF53b0mYOw5Kqe3YGiv1Wx23qAFN9qHLrTxpFI
         BBuDyAowNQs9RWqclVAc+gscqrUmWRkcqibKsZO9PJvZTzlBzUT1YPvW0342kwzQ6rbv
         EZTpSVagVRCLQoiU3GrWfbmTmYBfg+CYp6z/dIR+CSY+2sksHSiibdD3iPmlvxqAET9O
         n7CQDrVj1vCJpqhBHmj5Y26qd6BdZwACIKCkDGeRux0kjnPDgfVcZQ5iYxeTYykdjHDB
         jZ8ZSjVf69EMzsuqyCTu8AAX6sgNxYnvwB18Gf7WE/dnackgnYjpi3NXQ5MXtl/q3Jaw
         5K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771034344; x=1771639144;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6ds8ivclhd7/0EdtafyN3E0gV9x1foWSmGde/wizf4=;
        b=QpBGeXBqadtcEahLP+1iPQwNqWciHiHJ8YllJ/IE4rpL9+qp6URkwp5CH2PM9m+H7Q
         wJ3wfVeisLoLt7GTljtMgs4yqaDM8Wke3TJ7YwgKMs90OmAoV+x3wy5A/caZZfBGHMbm
         7nvyvgHPaQ2VxGY7/s93on379VBC/95rgrMQYSryyudzpj5fDphaLXshVbo8MWr+CmPx
         OLoJO6GF9ixa3hiKxG6hyOA++HwSLBy09Nxqe6tDJHAgIWnM5P0cePdKUIcTexFpBpIT
         clE9cgvJWRkTyTziaWhBTGlcgsfYbMdmM89GxXzEYb6PQ6bzKWd+3EoIF+HXheTtenYX
         XjcQ==
X-Gm-Message-State: AOJu0YxYqMzxv8lJMt5CTCDGr5IRySrUiQsS0ns7D/vC2nMUUYJFcaY1
	YJeCyptRuReRBMCQ0G2Lz8P+gTEExhm/GWYma7qffSMM2BERPwOyv33Eg0IydBwoy1M=
X-Gm-Gg: AZuq6aI7C2UuM2LTR2z+9JqVeB8fE1UkTn9H4Izb2iEKFQtclNnUebIrOPa0/1zKrec
	R0NAfgnoYkksq3IH1WxZxbMrZPbW1raYuKvy6+M17b6wp+tn4+qHzT3dgBmSxF1Dha7nAs55erV
	sOzyGi/tyC1FPoqYkXCsHB015DlZLa0kxjhaVSCSsnVCOWNXrD6Lvi1sG1DNN5itGDNec3c10Mt
	Ue6tPi+MvPFDNXZtYpqmapcKSXZEk0O1itCeFz5CPwSwefgLkVn1XgT5FNDt4BcW8Vk6w15kyiu
	Pe/KfYu1OYdCjs4Xzx3jHlNfBcfpC89KWVw5XbNabxt3QauyJI2OjTs95Tpp9IpunSBgOMBROD3
	mKMkezs0IrBJaAbxIAreEWdv0wQ2G6rhJ+Hn/thog+Puw/NDbEcIS404JTA7smO7Fp4stQcu3Ay
	pHeOHZ/25RQ9DKrBux
X-Received: by 2002:a05:693c:300c:b0:2b7:f145:a61 with SMTP id 5a478bee46e88-2bac97c4b53mr515500eec.31.1771034344125;
        Fri, 13 Feb 2026 17:59:04 -0800 (PST)
Received: from f55b40a4666e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb555b6esm508290eec.8.2026.02.13.17.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 17:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in vmlinux.unstripped
 (scripts/Makefile.vmlinux:72) [logspec:kbuil...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 14 Feb 2026 01:59:03 -0000
Message-ID: <177103434309.1537.16630109964798020395@f55b40a4666e>





Hello,

New build issue found on mainline/master:

---
 in vmlinux.unstripped (scripts/Makefile.vmlinux:72) [logspec:kbuild,kbuild.compiler]
---

- dashboard: https://d.kernelci.org/i/maestro:b5ed9b51212f5174ccbd9d812fc43e26fcc5361e
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  f50822fd8675c68d294e89bd102f7b487ca3acd3


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
  LD      .tmp_vmlinux2
  NM      .tmp_vmlinux2.syms
  KSYMS   .tmp_vmlinux2.kallsyms.S
  AS      .tmp_vmlinux2.kallsyms.o
  LD      vmlinux.unstripped
  NM      System.map
  SORTTAB vmlinux.unstripped
Inconsistent kallsyms data
Try "make KALLSYMS_EXTRA_PASS=1" as a workaround

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm64-mainline-64K_PAGES-698fbf49a1ae387ffbd780f1/.config
- dashboard: https://d.kernelci.org/build/maestro:698fbf49a1ae387ffbd780f1


#kernelci issue maestro:b5ed9b51212f5174ccbd9d812fc43e26fcc5361e

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
