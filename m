Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3016C6D6E3
	for <regressions@lists.linux.dev>; Mon,  8 Jan 2024 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="ee0/QMM/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e485c4948so8675315e9.0
        for <regressions@lists.linux.dev>; Mon, 08 Jan 2024 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1704724242; x=1705329042; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGXMp5GpRk2PaMKjnuYAVGhKrxrumxs21AnhEbKzyGg=;
        b=ee0/QMM/OGRKSxKq2ZWMK2HwAgOoPPeOHeSPCRtWHeobeU84cdAauL4IkUznCZUPTo
         PiZPuChKseu4N4s66xifTeWEk2+Qmauyr4KlPtBxQ+YMYKcJ8d0bZCO5zSBibI6yeGvC
         F300FJAmkAu7w9wPq0k/ljTizBXuD6ms0B1MlDnV2VoBs7CS7MmBO4EgmcdFXV9vUiHS
         3q7mIiTe9UGNXUHKT0X5/xr1qWa8VSFHfhUjst+H0R5zUthBGFFQh9PQygelcjEujE7e
         7bypNt0e0a5GqVjlU+Djr6r1wCP/FASorCudgKeyL56OZ3t6p6dFbAO3b/cAycclyVNw
         f7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724242; x=1705329042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGXMp5GpRk2PaMKjnuYAVGhKrxrumxs21AnhEbKzyGg=;
        b=Iavh4XwcxuAUXCzNiNziyjgQLnKMCgVE//YVXOs2ibviOEmq5Pdg6W8Dqlh236vf0O
         wPlh/ac15PlMkLSnqMcPe688INtJqpK5MpMi82L75FkR1M3XmmXNvZ8etODf5pqxaq3d
         62lkmxusQMtQw5Edr1FdvNqnifZ5/Njsz3G7NrbleXTbmWXGAVeR3GVegYaodoy8G80F
         eda5hbJ4LwESLgZkNVddaRk+Ti9hFlTgPqOH6f/xlTCLleE/ConX25WodGFOeZFSC55S
         TZDlWK6t8dKKxWsvcJFoDo5Ctks82/zMjX/bAcKMhHRka3QLel4b07jcj7EVZVIhuLzr
         GukQ==
X-Gm-Message-State: AOJu0YxAVEZHbGOk3yzT1IYcG9NvrPEWd+Xi0/hFDGXJ3dkBTaUTQSaO
	T/rzn3vMEMSXZks8MpwNX5bdjU+IqDNX7Q==
X-Google-Smtp-Source: AGHT+IEwfWaQFbuUmHfcePvb/9jvgHiMiXgx98V8fXrKbWiwvPqs4Wg1a4jTyra0C+3xHwgQKgIF7w==
X-Received: by 2002:a05:600c:2a8e:b0:40d:56a1:2538 with SMTP id x14-20020a05600c2a8e00b0040d56a12538mr2128824wmd.62.1704724241951;
        Mon, 08 Jan 2024 06:30:41 -0800 (PST)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id l12-20020a170906644c00b00a26ac88d801sm2213434ejn.30.2024.01.08.06.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 06:30:41 -0800 (PST)
Message-ID: <d88ca689-47e2-44d3-a1c9-c76ab1e00ee0@sairon.cz>
Date: Mon, 8 Jan 2024 15:30:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION 6.1.70] system calls with CIFS mounts failing with
 "Resource temporarily unavailable"
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Leonardo Brondani Schenkel <leonardo@schenkel.net>,
 stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.com>
References: <8ad7c20e-0645-40f3-96e6-75257b4bd31a@schenkel.net>
 <7425b05a-d9a1-4c06-89a2-575504e132c3@sairon.cz>
 <2024010838-saddlebag-overspend-e027@gregkh>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <2024010838-saddlebag-overspend-e027@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg

On 08. 01. 24 15:13, Greg KH wrote:
> That's interesting, there's a different cifs report that says a
> different commit was the issue:
> 	https://lore.kernel.org/r/ZZhrpNJ3zxMR8wcU@eldamar.lan
> 
> is that the same as this one?
> 

It seems to be a different issue. The one reported here by Leonardo 
doesn't trigger NULL pointer dereference and seems to be related to stat 
calls only, for which the CIFS client code in kernel just returns EAGAIN 
every time. The only related kernel buffer logs (example taken from the 
GH issue linked in my previous message) are these:

Jan 05 16:50:27 ha-ct kernel: CIFS: VFS: reconnect tcon failed rc = -11
Jan 05 16:50:30 ha-ct kernel: CIFS: VFS: \\192.168.98.2 Send error in 
SessSetup = -11

If I understand it correctly, the issue you linked has both a different 
trigger and outcome.

Cheers,
Jan
