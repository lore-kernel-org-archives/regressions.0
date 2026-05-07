Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2B0344030
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778191897; cv=pass; b=tq3KajXSwvPWGhYRWM1hDqFjjqQPC8xaAY2nd4tC2eWWk+IprpViOeAFj+kdts2mK63FMAves2/BlBTIsK2L3eQPJqVGkklaZwAkQ3xhV0uywIhgyW4wxqenJzYL1zBt2CbYGD1BfyNllVDv6/kzjWlPQbPYpp8Ii1N5PISXZls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778191897; c=relaxed/simple;
	bh=jdUKOifzZ0/49UQNF63fX/GTOHzSFLOQBXKUlp4xA3Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=N093ljh8fXWPmPCx83wyYMV7Xo+r/fAmHqJnDBaFkLVHHaQAbNn7BXwvOaeQhnJqkOU5GzosU2eQDr/PvwxLENrvgAisMPrPC7Ma3TkF6uHUU24S9yrOl6aURW/xfTTdDUS1eXT7ykubQC9F4KjWiygv7zL/BDZiGrQkaXTRPdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8kHFmNu; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8kHFmNu"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e8de47ed4so2324271fa.1
        for <regressions@lists.linux.dev>; Thu, 07 May 2026 15:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778191894; cv=none;
        d=google.com; s=arc-20240605;
        b=lw34rlThIIlPEaizLrKfoH/6NOL8ua34umPI2BkT+iQ31Nda/PKN0ULK1jzsLU3Pao
         VFS+Ez/22zi3kQnDHldTZHny3YIWbqGR2U2HAdkmXASD2mhWyKoKCF4OxAACUIJCnFAJ
         Z5vcKbUoLv58WsrY8xM0yWF1LVu5E2JH34FwE+fZVlqLPHD6JRAdlyTbfEzA8OztrTyP
         aJO6eWLgnIIE9Bt4ROZWC4egoCr8cf0Y379BMuxOIV6ULZ8DS+9kc5e7Q18wSFIGzXMa
         PtQX94PV84N4PbMEjwVIW4q3hjGv3b706W4Bv3UTgBvVWlN4G1f0acskvTlh2S3bHkUo
         4qOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=egUGSfKDYB7edPjylIc29b9M+jVTc181kEJ/BwMYBDw=;
        fh=urHKMVgT23m9wKWMoF3AgVWCXE+Q4cdsEMqS66Xx8s4=;
        b=WGikAoBaKgP00nQpazwJ2qmdkZ9W3N7lvWvvbVEa5VMqXJWaGwbMqcdPTx8KLwpDql
         7lZ5dxxgjj7hEjJMUCUSXl24wpeNLgEsGOVWNXJH17KHteiOXSLuxwqeyPKp5l75hVrU
         jm11YvEe87ZWqCfA1zJFgJBo7spCayw6qqb0pyeepdTN97aRDs1atk20LvOV8Ql0Ylpa
         coYRh82N6yyJxoSYRQNdDb2b/FdK/jMRS9+ZVg+3epRxiHqeqYitA7pVUQLIJ4DYGq8o
         LuvOV2ZOk6RUtFeL3uJS8HHCsQUVoAkyAcaQOfqGaYBkGAdeK3QkUEkP/NGZdCgZgCA/
         L6Wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778191894; x=1778796694; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=egUGSfKDYB7edPjylIc29b9M+jVTc181kEJ/BwMYBDw=;
        b=T8kHFmNu8R9cf1Xbu28qgnAFhvso5OGOX2P+ZCG1f9Jbysm6TqQjovaAvs6dwBbNa2
         Y80Bk/t7inujbupQXCdcHTseMn9KdOA0qCs8eJh5dWjHAPUso3Iu3oMJ96z8hXHZBvNH
         Vg7TFx+vWCFt7SgFnYKRjmUcemB1XpZLAWilBWGd9QCyRSCv/9Rh7afXBMGqxXK/LC2M
         SS1y+227IsBXGTEZJRBNlZHNp6taVPr+7TUurXYRSGUDIudwk4z5rAYp529kwVTaAdQs
         +a+N0Yjii7xzROI1uwvrVrDd2iq6cOewBH9JifDbJonmIDk0NYIZLxAYp0f7/wejGPig
         JFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778191894; x=1778796694;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egUGSfKDYB7edPjylIc29b9M+jVTc181kEJ/BwMYBDw=;
        b=TRIa7/V8oq9ywfBLf2dQnHzZ4tNkiDVE9CCyEohq7g4aM3BrOMXlmXd6sPLya2BNA9
         wijqwz4rGhfY13rJFmwquJzJVltf0XCs8cGA/ubMrFOcrGq4Nd7Uyy7DWfxtCSH+Bwdu
         X05s5uCVrgp4rUlT+kdd6PBkHHjMXHP0mAMPP4ZlTgGYOwYA96+v71yt09XOoV/wm0RM
         wJz0JRUgMTjbuOh2vPyX1qqT+CYCYNTXvEMCdTGcWB8iTMZEe8nCvXXuXP+sM+gAsypi
         h0S8UqEJlGCfnN9b4YMRSKTEUEBLwbf/+XfDz07fxURjEy3yzCi+xn0IWCv+EmoQnF9H
         a7Iw==
X-Gm-Message-State: AOJu0YxsWWhGleXfgiSZpLcsOseaGQM2iC+Zqr8jEmy3CLNDwJlLnsE+
	o9/ZLp8FzyoBCpwV/fzmbLEzCmtIwg8uaZsIHgbB8ssWPQ0MDitzS/LGCgEM5FldP1STQYo1TJf
	o70L1yyovaW/oDjM0tMHjgJG3xh+UKrc=
X-Gm-Gg: AeBDieshZ9Mfdv4cQLZgKE0gp6h7iYX7EXaViyGUAodSuCOKZGwHDsj5Jgf8HrCHApQ
	oUXTLKr9VzoM8DDjjfrFgiW+TBpPwOg38p6JpG2ABqaKinWzMXwbJpNnURc7U1H/mpTHZ1iddux
	Xz3k+3Q7tXSgeaiYB7zFZR0X0ywXBu8tEkYBVsoRN1l8EvPFAuyZ+hyeJ3fcT3b19wHXliMQqbT
	GmzcYM1ODAsUpb93utdkMID7aw7lPDwUJSgjXA7ugv4h6ZoZ5zQJy2isl6ywMih0z+LV0OjMHZ+
	mc/MHNIMHmSRPfWPBfuef8zrWft0m8DKAgDj96pmjsPMUR+byyCXcx15+rCc+soG18P8inrTyQ=
	=
X-Received: by 2002:a05:6512:33c5:b0:5a8:98b7:b69a with SMTP id
 2adb3069b0e04-5a898b7ba03mr671269e87.1.1778191894025; Thu, 07 May 2026
 15:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Jes=C3=BAs_Alejandro_Cort=C3=A9s_Pandele?= <jcor.alejandro@gmail.com>
Date: Thu, 7 May 2026 23:11:21 +0100
X-Gm-Features: AVHnY4ItfQ6xmcHUS1IJ5Dsc0Brc8ps3p2FLlcU3Bv3QT8leAMcm4FNsUIWLwqU
Message-ID: <CAEosg6nUPu526uA1OWo8UnTAiieMpwi2gPojd-LJUJnXrArmDg@mail.gmail.com>
Subject: [BUG] Lenovo Legion Gen 10 (83NN) - GPU power limit hard-locked at
 35W (RTX 5070 Mobile)
To: platform-driver-x86@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting a power-limit regression/issue on the new Lenovo Legion Pro 5
16IRX10 (Board ID: 83NN) equipped with an RTX 5070 Mobile (Blackwell).

The Issue:
The GPU is hard-locked to a 35W power limit and the P4 performance state under
load. On Windows 11, the same hardware correctly hits its 115W TGP. Setting
/sys/firmware/acpi/platform_profile to "max-power" or "performance" has no
effect on the GPU power cap, although the choices are present.

Diagnostic Findings:
- nvidia-smi reports "GPU Shutdown T.Limit Temp" as -5C, suggesting a
  telemetry failure between the GSP firmware and the SBIOS.
- dmesg shows repeated failures from the PlatformRequestHandler:
  [    4.655061] NVRM: GPU0 ... failed to get target temp from SBIOS @
platform_request_handler_ctrl.c:2171
  [    4.655071] NVRM: GPU0 ... failed to get platform power mode from
SBIOS @ platform_request_handler_ctrl.c:2114

Connection to other Blackwell issues:
A similar issue was recently reported for HP Omen Blackwell laptops
(Board 8D41).
In that case, it was found that the WMI driver was failing to send
HPWMI_SET_GPU_THERMAL_MODES_QUERY (command 0x22) with ctgp_enable=1 and
ppab_enable=1, which is required to unlock the NvPCF power budget.

I suspect the ideapad-laptop or lenovo-wmi driver is similarly missing
the WMI "unlock" sequence for the 83NN board.

System Environment:
- Laptop: Lenovo Legion Pro 5 16IRX10 (Gen 10)
- Board: 83NN
- Kernel: 7.0.3-zen1-2-zen
- Driver: NVIDIA 595.71.05 (Open Kernel Modules)
- Community tools: LenovoLegionLinux (legion-laptop-dkms) does not
  currently support this device.

Full logs (nvidia-bug-report and acpidump):
https://gist.github.com/kenju-u/e2fe8b86e521f4c844799518b9757f9c

Please let me know if there are specific WMI queries or EC registers
you would like me to probe to help map the unlock sequence for this board.

Regards,
Kenju
