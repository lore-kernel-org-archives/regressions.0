Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218840;
	b=29rN0Rr6Fn/mdsRE1xmpJo9+VmIykK0r2KouM/F9wGzCaBj8d3LSjrLoa+g93lsqsJLf
	 yauJVID5318F62885mvhjO2VbWBXk+4ZAowEgiwJUXOvDHmOivlk2whg6EY9ZKWCPnTAP
	 UN0MrFRO9MommNEbFO137I63d96P6mVg5M1kFwjJfhj+qkYdJADR6vXvQkNrEECVMf3sz
	 U6PadZ+A0D6o7QNcjKdjwFU6H/MFi5ovCa3S9eUIr45SW6NNBp29tL724DPrsOuThzOUB
	 hMitwZMKeTsgckbBA2DD/YBPeY7Txs2hR9FRz2B4W7ympiYRQTBMaQ2TH83jy+XFq8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dqc53VlCp3+UhG9y0wXxgHC6vxpg2u28zRHB3WOQFNo=;
	b=s99lRNRhNBguaCW4By+1zVqzyNmOVdrZntvDMq4RcwvzGIBCCbHcbnFszYHFWeYe0Ly0
	 kMrQcrOR3kxiCmqwIk58RY2FvouQSW54Okfv0iX/NYMmsL2AbN1mB7mZvgzoRy0OCHmAn
	 +zHs0R7npdoBjLpVQ0z8av9Q9PbRlPKOTqxhxqNPjLgMUUDl2HCp9UvG0+eGi7X1EuexC
	 1Ln/PIMigqDOnh84QeW5J0VFVBNaazZ6+ys8gnkQHxTZY+OZCvXpaX1Ucmf5XrZpN0QY0
	 5yJOinBt0fOMq4yyDMo7Tf31hsxxqbvxlE50J1R8LTOXzOg2lGemRnpBblj3hvgybcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxajILoF;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E141F606A32A
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 10:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E141F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxajILoF
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1200575eec.1
        for <regressions@lists.linux.dev>; Mon, 09 Nov 2026 02:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794218839; x=1794823639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqc53VlCp3+UhG9y0wXxgHC6vxpg2u28zRHB3WOQFNo=;
        b=lxajILoFEhsh7vEIWqVacMYfpwzTSeeGcAUqJevEEnty0ncyOwi4Kxn12ZU9JaXuxi
         Vup/WpkPDKj8lGk6hlgxXPjr4T6KzKX0+gWAk0c6OcfX36SrMwNz4rjA/Ez4QEwf4EMM
         ICJzb3zthTkD7r2GhprSGEJ953a6If62Ox4575VXOP79yyJU4ff8gU8bnd1XGBWUlXqM
         5Enqmv0orRyaKvL1OXO72VbuYGhGrDGkrsj9NbBDWlDBkOVQ+QE9JgIGHIjfdMF7TvVd
         lPecS+MWi/ijOrukjSEEtqkI4B/HNbNtMVI58y46eLoGovTT+qWY2KDuMIu+GkoXht+1
         sDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218839; x=1794823639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqc53VlCp3+UhG9y0wXxgHC6vxpg2u28zRHB3WOQFNo=;
        b=VX1Wyw59/4f8FQBQ0aVEHSdZdj/olCdQGFm76DesZPgesmwukE0YVEVZ7MlW9PX+Xs
         4mfXNTSORaqtyZWEw7iYOnqocNgwPnmQDT6W2lqBb07IUMQkxtE7J77TUAFglUv84oH5
         A+S5JrXu8nOCzdSWBF1OLZB+KFrjDMVqR8AmfHs/tjMdoeP+4be/+hgIvht6d3DOWaV9
         oxMQtrkC//Qf72GbUUbMiiHQOJYxnyWxmv/C/YlLcotuL6+0VrbQg32xK6c4360+AeAI
         r2EbVe+glhk5WDujXaJ1HArU0U/L0e1dZidtRX9IkuyfkvjdxxGEBKa2hKhbNjLYx9s6
         q2Vg==
X-Forwarded-Encrypted: i=1; AL+hErG9l8Z5R/JgCBhewBvNzA4BhTR2vJ5GsCiMHbPQABXKq+r+mAN/bNIFeliPzvowfX2q4O4YOaVOAq17Xw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/6Gak8Wo32G8hu1lbGDN5DAknY1cQuZnEFsr14vTUbsPTAdX+z
	JF8u29Lx3L4QmjcapKzYTnHoAu90wduj78pCm5b8W5yng6FRH5N4RadP
X-Gm-Gg: AYBFou3SyCX6ealT7xbqDbTgq8Ehdry1LcASk1wS0XKIYFP+zXigobFSJM3XXdTdxSd
	D3xrvMtiUoM/Q8mmkp05awY9uRS4ig1TiipKhGSaTtKDnCGZEH/IwqnT5wMr8svyr2I5OH54hgL
	QgNnhMSglBHX9i7wn2cF93erYOn/wtk5hK22cpcw6aff+qxT2hp6wCeuji5CFLLCesetz3QCe1D
	b9TG3sghfL9UePAOSBcqux8QfaK7hYnJaFuaeALflBf+2y7FNmz14V8ajDr4q7F9mvSj+5ChiGi
	glCOlTP3Sy31BtcOrDgZisCUe/Udw9AuWkTe9IQf4+FMao+UbvkVUSzkTNjXlEs4pgX+8okv5C4
	tQaxjzM+4Lni3xYx8VcMLHtmVHfPISy/7wTVVxHy1CXvUryxOXzcSPotGKvyZ4ADIW607kXO7XG
	fzPgB8IdrXvQypigigidwXki+OUxF8MRXB3XssBvAFiwXTyExZ0B5FB2dO6uwrYk1rQ5v7su3Hm
	BpzBO9iEEgvzWC3Ysoypo63BipWBODIb55C4IMIy7cxC1aq2lksIuomoTcakWx7Vwbc6I04vOf2
	uR40dop2qxBlpztaYoM9yP5WcSSm9DgZCrQYjmxWCcZ+LrvwaJk1NCBNr4gkdsIykPY=
X-Received: by 2002:a05:7023:a4a:b0:1b3:a89c:c456 with SMTP id a92af1059eb24-1b3a89cce8bmr3399268c88.6.1794218838912;
        Mon, 09 Nov 2026 02:07:18 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:53cf:9f18:268:d90e? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375603ee8sm11600527c88.9.2026.11.09.02.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:07:18 -0800 (PST)
Message-ID: <f718e7cd-24f1-428b-b9f7-28bb1a923a11@gmail.com>
Date: Mon, 9 Nov 2026 18:07:14 +0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: =?UTF-8?B?0J7Qu9C10LMg0KDRi9Cx0LDQu9C+0LI=?= <rybalov.oleg.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com
References: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/8/26 23:40, Олег Рыбалов wrote:
> Same model line, different board and CPU vendor: I see this on a
> RedmiBook Pro 15 2023, board TM2209, AMD Ryzen 7 7840HS. Adding it
> as a second affected machine plus a few observations that may be
> relevant to the quirks table.
>
>    XIAOMI Redmi Book Pro 15 2023, TM2209
>    BIOS RMAPH5B0P0909, EC 1.9, USB-C charging only, 100 W PD adapter
>    Fedora 45, kernel 7.2.15; identical on 7.1.8, 7.1.13, 7.2.7
>
> Same symptoms as reported: performance and balanced-performance
> return -EOPNOTSUPP while charging, low-power is accepted but reads
> back as balanced, and --block-driver=platform_profile restores
> working profiles via amd_pstate EPP.
>
> Three things I have not seen mentioned:
>
> 1. On this board the platform profile does not track the effective
>     EC power mode. The budget is set by the Fn+K OEM hotkey, which
>     cycles three EC steps. Measured at the package: ~15 W, ~35 W
>     (the state after every boot), and a top step that bursts to
>     ~65 W and settles at ~54 W / 4.4 GHz all-core.
>     While the top step is active, laptop_profile_get() still returns
>     balanced. So relaxing the AC-type check alone would not give
>     userspace control of the power budget here.
>
> 2. Ownership of the event GUID 46C93E13-EE9B-4262-8488-563BCA757FEF
>     flips between boots on the same kernel: some boots redmi-wmi
>     (input "Redmibook WMI keys"), others bitland-mifs-wmi (input
>     "Bitland MIFS WMI hotkeys").
>
> 3. Writing 'balanced' to platform_profile while an Fn+K step is
>     active is accepted and wedges the EC: package power drops to
>     ~9 W, all-core to 1.0-1.1 GHz, Fn+K stops switching modes, and
>     scaling_max_freq stays unchanged so the cap is firmware-side.
>     Only a reboot recovers it.
>
> I can test a TM2209 quirk or any patch on request.
>
> Due to a language barrier, this text was prepared with Claude.

Hi,

A short tip at first, please use the reply all feature in your email 
client instead manual insert "Re:" in the email title,
so we can keep the thread tracked.

Could you send the acpidump (from the acpica package) output? Then we 
can draft a quirk entry from this.

