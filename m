Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF54179949
	for <regressions@lists.linux.dev>; Tue, 28 May 2024 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929680; cv=none; b=izwilWDjPUe5nyd+VYWVaHhdQ+YMV+i3CH85JbbrXDz3dpgb5hNXnbXsqeK8EVrelfX6HwgiVMJfP8QF0+XLXbPCWfLoBXt4os0b30phT+oo7+gJBDSn+c/hX22zj2GQTuCQb3r1FFXVCTrxm3lLRIYyv9MICgPZMcUiFx9Z+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929680; c=relaxed/simple;
	bh=iEcVS7kNwhO3HFB9CScl6vFacYu+gRoXrd/D5F+ZUUM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:In-Reply-To:
	 Content-Type; b=EeSMwIMVXbRZcTFpC5i+3455GV+ck0pOvk7fscDB3enHyaffRvGAc+CKxcVTTu/HCl/AfofmZhuJ68CUnwQRy0uoZBYlXMyY9rZ9jggspKyoLlr9+P6XmBWltWsB1irArQgwSovKvVMtvfkfB31Ix4EM51eJeAufAJKhiPytdWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNVtnQQb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNVtnQQb"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-354faf5f1b4so1159270f8f.1
        for <regressions@lists.linux.dev>; Tue, 28 May 2024 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716929677; x=1717534477; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6FE63oTYkWPlAI/9XHCPUmOHWIDgyDXFFG5HlAkfZ4=;
        b=aNVtnQQb/w5Eh5I/fKWVtOa0uYIHDw3Ad/220iFtwWIKuBbt2oZZMbqAtZbjywpffQ
         dFVKNIcPLg/hef96fHhZFxZORilxsmf5mIJG6vqcuDbeAA+JH7ssVOv16JcqlbYX9vEu
         NA8kpxm9R6zO8GJrz60em/CcDt3MK7ksUS6CBvws44tDLloGvF8vSGYr4tvG3sTNYVrH
         GCsWFtqbVO+44B5gwBriHUy2fO+2YprFXzMajR4w2iwwvo+cJJNagDKUsrbVaze4koq8
         egi2US2N6xaW0O1FmtkY9Du31NUrGjvkTWQpII/955P1G/546Bd8byOCUS4q2UCbn+eF
         YZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929677; x=1717534477;
        h=content-transfer-encoding:in-reply-to:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6FE63oTYkWPlAI/9XHCPUmOHWIDgyDXFFG5HlAkfZ4=;
        b=NcwpllbnWbJrY19fG5Hc/xR9tPrZN0+CALlmw7q062PixuduLujY3mHDXWo4MfaXPG
         pMo09B++wMzjjhRDh6Oz+hQmYL/8uujYju0mEpSjQvafaAkw6ZhvOq46dwoAkDUE7Qs3
         GODqAau11znhHR9JoDj+eBMoR0giiQ9q5HQuD6ZYfLe+C7xYZpR2mCg4Ca9UdeBI8Vgm
         8xxJWoZFqZqmi9B6p6Gbn1pm8dXqDw6PO4EPAaFm8myvzp7bvaSnF8bLr07U7Fd44inl
         aUryQGoeUhPoThhXbF11Msxn/L1r8NWFOJ8fVgEB46G//yZz2Z/Qsjxx7y9ZdPJggD/A
         mpKw==
X-Forwarded-Encrypted: i=1; AJvYcCWsekA7NLXqS2w2+rF3Lk5/ToOmva87E+xTx8PScEyu5EbpaGHlkSKzc+/IwRLguPAdFM0lOYa0BJAF6q5z7o1gI4XbR97AN9eY4IA=
X-Gm-Message-State: AOJu0Yz7McMFaqbTU5vZvYklWDapby0L5nEY3maJHUBxVHA/FteIWWdg
	Uhv4s6/j2bF5I6AzZkxujfzxPc9DAFVbmREm5Eut/nGLopMxcYzh
X-Google-Smtp-Source: AGHT+IHjFpmdzBHqUWc+Pqo+B6yRQMIbFlgbaMgYEfh7yVC87GyDVnV/XkxD6Xeb2MSXu/Gut4OMVw==
X-Received: by 2002:adf:fc91:0:b0:355:3cf:49ad with SMTP id ffacd0b85a97d-3552fe185b8mr11130763f8f.65.1716929677150;
        Tue, 28 May 2024 13:54:37 -0700 (PDT)
Received: from [100.64.100.6] ([179.61.241.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a08abd8sm12751917f8f.32.2024.05.28.13.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 13:54:36 -0700 (PDT)
Message-ID: <c947e600-e126-43ea-9530-0389206bef5e@gmail.com>
Date: Tue, 28 May 2024 22:54:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mike <user.service2016@gmail.com>
Subject: Re: Bluetooth kernel BUG with Intel AX211 (regression in 6.1.83)
To: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
 Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>,
 =?UTF-8?Q?Jeremy_Lain=C3=A9?= <jeremy.laine@m4x.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Content-Language: en-US
In-Reply-To: <8e8ca7a6-1511-4794-a214-2b75326e5484@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.04.24 20:46, Linux regression tracking (Thorsten Leemhuis) wrote:> 
Well, did you try what I suggested earlier (see above) and check if a
> revert of 6083089ab00631617f9eac678df3ab050a9d837a ontop of latest 6.1.y
> helps?

Hello Thorsten, Jeremy,
I hope you don't mind if I jump into the conversation trying to help.
I'm also experiencing this bug (with an Intel AX200) and I don't see
any updates in this thread since a month.

I tried reverting 6083089ab00631617f9eac678df3ab050a9d837a
on top of6.1.91 and it looks much better: it's been 10 days, and the BT 
and the system are stable.
Previously, I encountered the mentioned "kernel BUG" at each boot, and I 
was unable to stop/kill the bluetoothd process.
Let me know if/how I can help further.
M.
