Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9F537E3
	for <regressions@lists.linux.dev>; Thu, 11 Jan 2024 18:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxsvr4F2"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd928a1d58so5004331fa.3
        for <regressions@lists.linux.dev>; Thu, 11 Jan 2024 10:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704996647; x=1705601447; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8MzGwjS7UwP3U91XL/YsEQzbL7bGEpHB7jHf4hs7+U=;
        b=kxsvr4F2ezwUqIqFtVGuxCvZDPWfav1761GO9mIEapQn/3y13yaWkbFjvwit+1gAa4
         VbOctW4lw2kSVTCdjvZw3XZ8IEVFBS4sk0h52kUnxrrvcHd4K0KWIPd+6nwBVrf6S1yg
         o5ma9QUhxnKufWej8tXpkFMAQBMjdeu4gkIx5Nzc7hGU2mdExs009fu8LTxZmJVPegTK
         5oCQDjWyiTkO41F5cAq+ES2gnBrM9M03K17uGh0FKM0VhA/sA+rm3A4U4TI0/BP73hM4
         WhRJZx72oZ9flUgD/rJAyi+rV0gfXYRH8HBM5QrVsb/K/YA6wbXcbamsKSge4DC89LyU
         8Scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704996647; x=1705601447;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x8MzGwjS7UwP3U91XL/YsEQzbL7bGEpHB7jHf4hs7+U=;
        b=K6Ygx5JZaF77gvSZ2vMABMwKxfrnnefeSkr4V8PbBih2ylsieaUNZpBZEnDbEygHNv
         DIbCIc6/7vaFVSGV3hZqhy1T+a0/HQz93knJoLQj6zGxYZdLzIo7ggiI/+3BNos8bcPH
         vn/uADlo9Pgtg2RIwbfn2Ofu1G6zOszYXUaJcmq9oZMc3DBGVOKY9w91o+XXU83++yAp
         ciBbbz9u12VbbugxabqqxHM0nnXiu8jvnlnfChlNsRVFRPrY40HfhczwP4z4+WFVzhIR
         HnlRiKWbKFsjul1XvqlOmouijZhlUItTtGzpg2CrxjLyTm7CnfwOD7n4U+HIMI1dRScA
         v7ag==
X-Gm-Message-State: AOJu0YxfOwjgD+KNt3wu5AMwPmqgrdukVyrE9sDgZnPBwbA9PINzxfBc
	JrJkRbkP5GHS50WIqc3yyjLcHtXYEH4=
X-Google-Smtp-Source: AGHT+IEaMU/qyfvNK/VzMyGaINb1ldwY/ECFlo1I7A3qy8ZZY1ib6x75XnqVWaRgFESEoBAGDlvQyA==
X-Received: by 2002:a2e:9c09:0:b0:2cc:8dda:c96d with SMTP id s9-20020a2e9c09000000b002cc8ddac96dmr62223lji.28.1704996646631;
        Thu, 11 Jan 2024 10:10:46 -0800 (PST)
Received: from [192.168.1.105] ([31.173.82.245])
        by smtp.gmail.com with ESMTPSA id b15-20020a2e894f000000b002cd5b233861sm201538ljk.60.2024.01.11.10.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 10:10:46 -0800 (PST)
Subject: Re: [PATCH 2/2] ata: libata-core: Revert "ata: libata-core: Fix
 ata_pci_shutdown_one()"
To: Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org,
 Niklas Cassel <cassel@kernel.org>
Cc: Dieter Mummenschanz <dmummenschanz@web.de>,
 Wang Zhihao <wangzhihao9@hotmail.com>,
 linux-regressions <regressions@lists.linux.dev>
References: <20240111115123.1258422-1-dlemoal@kernel.org>
 <20240111115123.1258422-3-dlemoal@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <d63a7b93-d1a3-726e-355c-b4a4608626f4@gmail.com>
Date: Thu, 11 Jan 2024 21:10:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240111115123.1258422-3-dlemoal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/11/24 2:51 PM, Damien Le Moal wrote:

> This reverts commit fd3a6837d8e18cb7be80dcca1283276290336a7a.
> 
> Several users have signaled issues with commit fd3a6837d8e1 ("ata:
> libata-core: Fix ata_pci_shutdown_one()") which causes failure of the
> system SoC to go to a low power state. The reason for this problem
> is not well understood but given that this patch is harmless with the
> improvements to ata_dev_power_set_standby(), restore it to allow system
> lower power state transitions.
> 
> For regular system shutdown, ata_dev_power_set_standby() will be
> executed twice: once the scsi device is removed and another when
> ata_pci_shutdown_one() executes and EH completes unloading the devices.
> Make the second call to ata_dev_power_set_standby() do nothing by using
> ata_dev_power_is_active() and return if the device is already in
> standby.
> 
> Fixes: fd3a6837d8e1 ("ata: libata-core: Fix ata_pci_shutdown_one()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  drivers/ata/libata-core.c | 75 +++++++++++++++++++++++----------------
>  1 file changed, 45 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
> index d9f80f4f70f5..20a366942626 100644
> --- a/drivers/ata/libata-core.c
> +++ b/drivers/ata/libata-core.c
> @@ -2001,6 +2001,33 @@ bool ata_dev_power_init_tf(struct ata_device *dev, struct ata_taskfile *tf,
>  	return true;
>  }
>  
> +static bool ata_dev_power_is_active(struct ata_device *dev)
> +{
> +	struct ata_taskfile tf;
> +	unsigned int err_mask;
> +
> +	ata_tf_init(dev, &tf);
> +	tf.flags |= ATA_TFLAG_DEVICE | ATA_TFLAG_ISADDR;

   Why set ATA_TFLAG_ISADDR, BTW? This command doesn't use any taskfile
regs but the device/head reg. Material for a fix, I guess... :-)

> +	tf.protocol = ATA_PROT_NODATA;
> +	tf.command = ATA_CMD_CHK_POWER;
> +
[...]

MBR, Sergey
