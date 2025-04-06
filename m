Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A5CA6B
	for <regressions@lists.linux.dev>; Sun,  6 Apr 2025 20:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970171; cv=none; b=MDv3VfSUFCQhLWcqBWm07F9MqYrwfQaF28hVOrIyO4VTnaaDmtfty8eewMGXK/48ioTVLd5qm3P/MxHKvZsWTr0/r21gLKSWPjZWSdc8mZxnOabF0mS9VNKWNjzfohktn8iVEjp8LEfp+B08/J0KrmkAZGA+3yTwpEPqXdmH77s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970171; c=relaxed/simple;
	bh=FeX9Da7j7xjjvgV7fOfFrT0DEp5+G/2D7CRTyTiC65c=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Z2JNy5TGFZpydC81aN50taKe01xztYB5DZZK/w/0M1bijRuKEePlsAl2xM3qIyCd77TB1s6+hUu7oCNlwr3RBNiOLPuQJvmT76t7147sfoDiTyk1i61KOIUrBaK0axckIboNYh/yCQF9OZj/fwCASplmt2y5JkijCZma8q+qFl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+yDswIv; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+yDswIv"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54af20849bbso897424e87.0
        for <regressions@lists.linux.dev>; Sun, 06 Apr 2025 13:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743970167; x=1744574967; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoAocNUJiNbZNsfCBlVtbpA5Lz/4VCpy0zktz4e81Uk=;
        b=k+yDswIvrP+wcZlGslOu9yCKkVweVqf2a3ggkivhK0WX7tIvM47u5A0At+YAx/DpRu
         PttslxMolCLkjkTfDHIgaiF5ovsyQ68lMWy5EXqv4sgB+zRblXZUw5pgrvLJqQFtrH+S
         LFXVbL1lE3Fm0VFT4nc3dVHNpHfUhzjfZW9U/E082HbOZeyFjGE5gcurp71AAbhfFzS/
         bQOt5V9R9E0IMHspsgw0pfGuIq1hzAcE82Mnbxrvb3mR+lMrvEsiHyqbhkuw2tk5IKc4
         UklBtHtuFY0mKnKvv01+0ihH7GB3j0QbqG8hEg2e89Yxm7pkcDepIglH0BKpmz28BTON
         VIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970167; x=1744574967;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PoAocNUJiNbZNsfCBlVtbpA5Lz/4VCpy0zktz4e81Uk=;
        b=jQCeIL76+tBOoDtltBuVWJSKBp5stV8NtblKYIqFvW+Tu0GKtSUr6Mk+dydrdV6ify
         LIn6aeDRQZzkEIB33T6Z3U5wd+UJqOPAvLBU4ZmNXCtUpM2tueCZpk9sY1T3bI6qNlew
         XwM1uv+1AlWkIi6oYSidlYWCqHFkZndQ7cc7HfoCb58BUzs1ho6iOjLhMOSph5ak0Zqf
         jXHYst5dW337oI/q+SAPEufIb+b3ECxzlTO45jcsBsFwTheh3287bJineOLufXg+ja3I
         wPsPzORxzcOHTWnF/xfb6A28dz/FsD0OzN0GlHZmCVyJriwfK8xHYFNN46psyhpxo+UI
         jLOw==
X-Gm-Message-State: AOJu0YwfnfshiDHutpSNsgDQQNfLhYBQspwK2jOINmVnAjQjejA+u/DB
	U+Y2UKa74Fmn8tWNN2G/tK5BnbgkQv6yoE8JuFJZsMAATy1cPxBkXhe3HJqXMNc=
X-Gm-Gg: ASbGncs4leB/sUcGLXivhho5iCrDjIidDlURtZVSzilBWCtcS9K0CGiTAtV6U8M13aw
	d/ehUnUcSC0d9t8I4xzRLbSmzlqXDnhM1IK4FgAw6MwwwXWntEgg/o6jeekjNHx52idnsuC+Lg+
	mGhymhwfnyPAXiEzr/6I6Dbfehjyjz/A5AgVLE0u+onNtI1RnAVJYJMsANH+I6GabSx3j9VwTZE
	4zuzv6KIUHBXR7SJBjNN0+KKlx2B136U+W0UBcXGxjP2E9eD1Er6fcTgbkt8ZhJ+QYjaEY/UjWf
	PTQbZSuq7mdUbyK32tObOsuDGoKWIogMjL3G/HcIPRLf8DzoEw==
X-Google-Smtp-Source: AGHT+IGbiaprxVPMc6giMDKzqasfvQ47smUiuakBXi75pphPh+C1fPhpghbH5tKbjiwVS31VxDljjw==
X-Received: by 2002:a05:6512:4003:b0:545:2b24:c714 with SMTP id 2adb3069b0e04-54c22779e5cmr2704867e87.18.1743970166953;
        Sun, 06 Apr 2025 13:09:26 -0700 (PDT)
Received: from [192.168.0.101] ([217.172.18.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e636395sm1039843e87.126.2025.04.06.13.09.26
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 13:09:26 -0700 (PDT)
Message-ID: <5b193b75-40b1-4342-a16a-ae9fc62f245a@gmail.com>
Date: Sun, 6 Apr 2025 23:09:26 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: regressions@lists.linux.dev
From: =?UTF-8?B?0KHQtdGA0LPQtdC5?= <afmerlord@gmail.com>
Subject: [REGRESSION] Intermittent video signal on IPMI on Supermicro
 X9DRi-LN4+/X9DR3-LN4+ motherboard after kernel upgrade to Linux 6.13.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Good afternoon, everyone. I have a server with Supermicro 
X9DRi-LN4+/X9DR3-LN4+ motherboard with Arch Linux installed. After 
upgrading the kernel to Linux 6.13.4 after booting the system when 
connecting to IPMI KVM I have constant video stream disconnects that 
resemble a blinking monitor. I'm pretty sure it's because of the kernel 
upgrade, since I only upgraded it. I ran git bisect and found the 
problematic commit.

|# bad: [def122b64e37daa39774d4afa433ad42b8a5eaf3] drm/nouveau/nvif: 
remove client version git bisect bad 
def122b64e37daa39774d4afa433ad42b8a5eaf3 # good: 
[754c9129b9494b2b058add1d1a627fb3c9466a03] drm/mgag200: Use hexadecimal 
register indeces git bisect good 
754c9129b9494b2b058add1d1a627fb3c9466a03 # bad: 
[aa48c30f096bc10a583c2294d87713f2802986c2] dt-bindings: display: panel: 
Document Densitron DMT028VGHMCMI-1D TFT on ILI9806E DSI TCON git bisect 
bad aa48c30f096bc10a583c2294d87713f2802986c2 # bad: 
[7e33fc2ff6754b5ff39b11297f713cd0841d9962] drm/panic: Add missing static 
inline to drm_panic_is_enabled() git bisect bad 
7e33fc2ff6754b5ff39b11297f713cd0841d9962 # bad: 
[02fa62d41c8abff945bae5bfc3ddcf4721496aca] drm/stm: ltdc: reset plane 
transparency after plane disable git bisect bad 
02fa62d41c8abff945bae5bfc3ddcf4721496aca # bad: 
[d6460bd52c27fde97d6a73e3d9c7a8d747fbaa3e] drm/mgag200: Add dedicated 
variables for blanking fields git bisect bad 
d6460bd52c27fde97d6a73e3d9c7a8d747fbaa3e # good: 
[e8f834b559621d634a939381caf99a024e272211] drm/mgag200: Use adjusted 
mode values for CRTCs git bisect good 
e8f834b559621d634a939381caf99a024e272211 # first bad commit: 
[d6460bd52c27fde97d6a73e3d9c7a8d747fbaa3e] drm/mgag200: Add dedicated 
variables for blanking fields [afmer@Furina-PC linux-torvalds]$ |


