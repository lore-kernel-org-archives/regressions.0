Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207544DC89
	for <regressions@lists.linux.dev>; Tue,  1 Aug 2023 18:36:22 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bbd2761f1bso50308575ad.2
        for <regressions@lists.linux.dev>; Tue, 01 Aug 2023 11:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690914982; x=1691519782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcfz0R863zI3puuV2hq31o7wiMDL/GrNDWB4uRz0UMA=;
        b=WDIYjsPzoKz+qXWukxGc9hXSFdyeh9dMi+uwDJizyJnjC4RQHrYxavijMSU7ebPIPC
         hQ+XDUIjG/cuLWNfnecrMT35N/a4HeF5rgY/jYB2EB/GejotIy32FjmOsXplymd3+hDg
         Sqtdrv2yuP6K1k+qEQ97WiL9seSZddiq/sz3Hlu77lYzYYpZ0PsUkeC8kbzr6vTafKEw
         bh4fEaNK0bVUjosSdUNHAu0jHJhO/MKlRXSKJsdHPrTXeXz1i7Uuot4ueo0efewkcI5r
         9R5Qb0tnouExPTNNZ0WxcWw4lDdLQftPCBBInGOBRB5lhbF2Ss/ii+X2qezcFYWclyRp
         4xvg==
X-Gm-Message-State: ABy/qLYP5N7YFB1AT+n61j7xfQTcVkoXUm7ZT8WiP3MnCYb5XHqtm4o1
	4ddZGZXYm77B2DvRuccgkIE=
X-Google-Smtp-Source: APBJJlFEZHbhrk80IMySZCiA2wwL94qZptM+hPS4ANLpvhWT/1MzxDDnzuzluExdej7RBTRIydy0fA==
X-Received: by 2002:a17:902:d4c3:b0:1b7:e355:d1ea with SMTP id o3-20020a170902d4c300b001b7e355d1eamr15212995plg.24.1690914982313;
        Tue, 01 Aug 2023 11:36:22 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902ee8200b001b04c2023e3sm10785049pld.218.2023.08.01.11.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 11:36:21 -0700 (PDT)
Message-ID: <8c8f38de-f418-6ffb-8949-f6eb85602d98@acm.org>
Date: Tue, 1 Aug 2023 11:36:20 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ata,scsi: do not issue START STOP UNIT on resume
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org,
 linux-scsi@vger.kernel.org, "Martin K . Petersen"
 <martin.petersen@oracle.com>
Cc: Paul Ausbeck <paula@soe.ucsc.edu>,
 Thorsten Leemhuis <regressions@leemhuis.info>, TW <dalzot@gmail.com>,
 regressions@lists.linux.dev
References: <20230731003956.572414-1-dlemoal@kernel.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230731003956.572414-1-dlemoal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/23 17:39, Damien Le Moal wrote:
> Given that ATA devices will be woken up by libata activity on resume,
> sd_resume() has no need to issue a START STOP UNIT command, which solves
> the above mentioned problems. Do not issue this command by introducing
> the new scsi_device flag no_start_on_resume and setting this flag to 1
> in ata_scsi_dev_config(). sd_resume() is modified to issue a START STOP
> UNIT command only if this flag is not set.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
