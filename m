Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6871620D509
	for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493657; cv=none; b=UYgYQOroH6rRrwuH2OsT/SOaS/wGTp/UfyNFgLViUbt8k5f8Cmq8bqozguU06VEfjCunIspbSMPGx0P/uhH7Hp/evI3fBXKozacvvwMFMiZ0ihujGJ1XCMNRe78ANAi1qL39dgxe5S8V7xcuYSdCpo+ZbL/3daA16Rqnvhhr+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493657; c=relaxed/simple;
	bh=9R6Ud6LiDYCpYeYviU/YkLzW5K35i9P5GV1pnLp/dnM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jMz6WgROFOD/XfSL0AbEqVIPRvbuVQKQjdT0SRvcqqiYSnY2KXAe7Rd9a9SGXNk5PF+XwUqPEA49Eaa74RWoOG9MCfbAPIbjE2alJSMcGybcU/zInzdY6CEOTbkwdUgSjIXoXE7rHB8INaB8Wnvv/J+UUwYYbyZUAuXUe0k08Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+ADtwhT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+ADtwhT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391295490c8so47406f8f.3
        for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745493654; x=1746098454; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEx/AtEUJK0OF855G8GNoJBNytgIniB/cH0GIaq4g2k=;
        b=I+ADtwhT4w4n8HpqIV3LPR1vYShVzI+wZHFYDhvRA4DCpPIUUeUr4KTB1UAbFwvSN7
         IgM6qV0E/KsGcU8y80T15U0W5Dabn+9l2EhI5+6MLvBkCnrPOxomoqqQNac/D4Ct4TYj
         kOipz98UbqqgynxONsy8miNtSnINfBCP35daXTcvzEVeMWuvjYjjW2Y/zSExoZvKEW/6
         7hqKo7vg/an9iOtwGyBNs5t5EYKJ3uGuQ4O81PI3faPLXJbWY+b0LQ2Ch/R6K6IYlhr/
         BjSTXEms9lsDuP2Fbk8dNPWBlk8JYke2yLg1zFUq+xe5TaF1P7sgYh8gQyoc4/q4xpzy
         1YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493654; x=1746098454;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEx/AtEUJK0OF855G8GNoJBNytgIniB/cH0GIaq4g2k=;
        b=CPaVMJb49K+NP6r29y6r3/sSoj47MWK8IKZ6eMzh5V2QD+pBlgIKmol81fEYxCoax9
         aR+oXD8IS99TxVz2cY3tSugzh0pU31OWuQYowC5xUmaLShHkiJS0ngIGOPm8hxaQ5Uza
         itAgAVt9R12buRzVt1GTFQ7Qm33/z8AVRa143A1bQwxxA5tfPELOdQ/iaOF3vCSiFyOA
         3UVyJqc0YjYuYye2tPwjNUvLJL+rrlcs/nlmhghCojYK6t7uT7RVlHKQ4BghPRHjI7fl
         OXrA0zCSct9Lxpw2VSWRKqPyOSMWElNRaHJeDOrWF7JSLpiAEqcc0F2+DS5UF5WORf/H
         libQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfsgQDAyPuFJ+dbYs8dZdM6kaBAMXjMizWg8qUpUHnjBITohCJ2qpDrVIFKMSX8oXo3nFL9o47p4DYzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzLIN7pwAobYWt28OjfMvbqzFIElPAuC+/rIC/NDjnEBFxyd49
	IXpV9uoLbdwwGo4bMaU/7frDdHRZ2WyhKyjdxGJS0VXxJ/LYSWm8
X-Gm-Gg: ASbGncsoIIj5gXANlBwiqvHlpap17fl2QRCgt8PIrmZ+BOrPF6VcFAft10/axVLs3c5
	JvEuCUcDBoQv2bYxq7H+C9nYWdBP3XmJmc7EoUlAgiHthbxUXuaLfe+7DI9GrYFY0mxhsYZL86d
	dhQRt9RuGwWCnqcajUwkkgbSiRplj042YlLy0lUOU6TxZwOJPLQ13dY21nKfLIMM6ZtPyGcIUQw
	eyBkNZx8jTPSAGE/dMxG2YTrfRQJebM2bYDxROG/QHSXqFnzACDzOUn7M5DJghFCimDdTmLCQh+
	67hiWbESTkHKaDKOz5qVfjDDZhdBrxvPOYhDVr3xYu2PLBo=
X-Google-Smtp-Source: AGHT+IFwGNtu2sbgV5btwxIgIwM9+K9v7YDMIK46h4W+kW0f98Q9lDzvWTk4KCKxq5MmSKK8S5ML1g==
X-Received: by 2002:a05:6000:1846:b0:386:3a50:8c52 with SMTP id ffacd0b85a97d-3a06cf5beeamr679097f8f.7.1745493653457;
        Thu, 24 Apr 2025 04:20:53 -0700 (PDT)
Received: from [192.168.36.152] ([82.66.27.2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4409d2c3b0asm17261405e9.40.2025.04.24.04.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:20:52 -0700 (PDT)
From: "=?UTF-8?Q?Jean-Fran=C3=A7ois_Ingelaere?=" <masterprenium@gmail.com>
X-Google-Original-From: =?UTF-8?Q?Jean-Fran=C3=A7ois_Ingelaere?= <MasterPrenium@gmail.com>
Message-ID: <28ff58dc-72f3-4b71-817c-ccb4ff5f777d@gmail.com>
Date: Thu, 24 Apr 2025 13:20:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FW: Wireless speed regression issue with >6.12.12/6.13.x +
 firmware update for mediatek MT7925
To: =?UTF-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?=
 <Mingyen.Hsieh@mediatek.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "kvalo@kernel.org" <kvalo@kernel.org>,
 =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CACr2tqu10_mXiXw-Q3VSqYBJhQU1s_m77_uhvjpe0j3H3jhbgA@mail.gmail.com>
 <TYZPR03MB61644B8F34946A73E2C16E27F4DF2@TYZPR03MB6164.apcprd03.prod.outlook.com>
 <5a07aea2090532682c8cd4df3ab1b9026f2e1cd5.camel@mediatek.com>
 <04dca014-881c-46b4-a084-2001c62b466e@gmail.com>
 <6cebf6265f5f981dd951851d0832633292a60a46.camel@mediatek.com>
Content-Language: fr-FR
In-Reply-To: <6cebf6265f5f981dd951851d0832633292a60a46.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I hoped you had previous messages. Firmware is the released from my 
distro (Gentoo Linux) 20240410, but yes you're right, the firmware used 
in this case for mt76 is 20240305, sorry.

[74734.459451] Loading firmware: 
mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
[74734.463449] mt7925e 0000:73:00.0: ASIC revision: 79250000
[74734.539692] Loading firmware: 
mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
[74734.539760] mt7925e 0000:73:00.0: HW/SW Version: 0x8a108a10, Build 
Time: 20250305132908a

[74734.878892] Loading firmware: 
mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
[74734.879069] mt7925e 0000:73:00.0: WM Firmware Version: ____000000, 
Build Time: 20250305133013
[74734.974255] Loading firmware: 
mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin


The AP used is a Cisco C9120AXI-E.


Best regards,


Le 24/04/2025 à 13:06, Mingyen Hsieh (謝明諺) a écrit :
>
> On Thu, 2025-04-24 at 12:16 +0200, Jean-François Ingelaere wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > Hello guys,
> > 
> > I've just tested 6.14.3 kernel which seems to include the patched
> > driver. Issue is still present, in Wi-FI 6.
> > 
> > Here are some more testings :
> > 
> > 6.14.3 + firmware-202412x speed is NOT correct in download but
> > correct
> > in upload (20Mbps/750Mbps)
> > 6.14.3 + firmware-202504x speed is NOT correct in download and in
> > upload
> > (<10Mbps/<10Mbps) 98% of time
> > 6.14.3 + firmware-202504x speed is more or less correct in download
> > and
> > in NOT correct upload (400Mbps/<10Mbps) 2% of time
> > 
> > With older firmware, speed results are inverted as in 6.12.12 kernel
> > (DL
> > / UP), with newer firmware, upload never work correctly.
> > 
> > Please note the speed is mono-thread/mono-stream (ex : iperf -P 1),
> > while running multiple simultaneous connections, the DL speed with
> > newer
> > firmware seems quite OK. While I'm not having any issue in <=6.12.12
> > with mono stream.
> > Remarks regarding upload speed doesn't change.
> > 
> > Any idea ?
> > 
> > Best regards,
> > 
>
> It's a bit strange, the latest firmware should be 20250305, there
> shouldn't be 202504. May I ask where your firmware came from?
>
> And which AP are you using? I will test there combinations as well.
>
> Best Regards,
> Yen.
>
> *********** MEDIATEK Confidentiality Notice ***********
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or
> otherwise exempt from disclosure under applicable laws. It is
> intended to be conveyed only to the designated recipient(s). Any
> use, dissemination, distribution, printing, retaining or copying
> of this e-mail (including its attachments) by unintended recipient(s)
> is strictly prohibited and may be unlawful. If you are not an
> intended recipient of this e-mail, or believe that you have received
> this e-mail in error, please notify the sender immediately
> (by replying to this e-mail), delete any and all copies of this
> e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
