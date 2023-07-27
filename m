Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957A14AA5
	for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 10:22:59 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-267fc04ec74so610486a91.0
        for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690453379; x=1691058179;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOS+4iMvfIqSqMDfD009RckKJ93j4gnKYZMgqoKrYXA=;
        b=qiqhDJsW68fry/uR4TLtmce/93goZBVsCTW8/DS42XKrLFR12FbIPDUs/wX3Yqyn5S
         5OdxFeBD4XCEIGOAYMgZ0GuzRaR9jFmPCE4RYxUbVQ+isd9le6c1p/ELlzV3yL/ovcbw
         NQXOdhIfMlDW7KY0YxnS3VyZxghvjzx1rwhblxhg0WlfylsY8gHUrfDnE2IuMmJSfZee
         twAcIanP4ZNZFQIK9W+xP5YOi/+9nuKkVLfz+TXge9geGixVqcuIF76+sqSHZQU3xYLo
         XMc+3Ps+jm1iaYHENJfTht4DHLsNr2rNomckm2KKF39AKAVELwIfWf9HjBSQL4qWjTeq
         Q64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690453379; x=1691058179;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SOS+4iMvfIqSqMDfD009RckKJ93j4gnKYZMgqoKrYXA=;
        b=UbJOAxPcnc1sZpVpMBAKOZeS3deQnJNeQ2BCCrtI0fysI2fRQ+DU10LoLWQihUffeS
         ARxXjgvsENDc7MKZTVO2MbUv8QGSXX6QbbGQOow6/EKvpfvPKkb7IYkxyWyTQAukpei+
         2EVdXf5Uz9rr87u/bSpraw4mAcmvqWqkIZxh150yQ2ukG6Vqlh3q5L8A3BAwlMh/ii1T
         iusgG4v+nG51JGbFg2GjrQ5ouSobEcqgHJZFriGmKjnlR7+QwNgVMEOJT1rMU6lnsVRb
         jd4ieXBg+Oec9SIkPXHNpw4K6nBsOpAX3VhU4pohfnyP4222z46kOwOyZC3RG8lIbDmg
         maVw==
X-Gm-Message-State: ABy/qLb5CXS2SLknB51eqgSKry9S32SsEvjIP9BP4DmJqhtyXMuAMdVJ
	uDyseHPzYCNm1NJThSGjW94=
X-Google-Smtp-Source: APBJJlFddPx3cGLNjyXpDC378SkH9rHKbY7ad9h5Wq6Htdvyb1Wp3rP77aG0mAzX2jor48p7Ca+OCA==
X-Received: by 2002:a17:90a:114f:b0:25e:bd1d:4f0c with SMTP id d15-20020a17090a114f00b0025ebd1d4f0cmr4156327pje.10.1690453378929;
        Thu, 27 Jul 2023 03:22:58 -0700 (PDT)
Received: from [192.168.1.121] ([65.129.146.152])
        by smtp.gmail.com with ESMTPSA id g4-20020a170902c38400b001b85bb5fd77sm1243108plg.119.2023.07.27.03.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 03:22:58 -0700 (PDT)
Message-ID: <86435987-734e-c6c1-a857-1ba80da709fe@gmail.com>
Date: Thu, 27 Jul 2023 04:22:57 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Scsi_bus_resume+0x0/0x90 returns -5 when resuming from s3 sleep
Content-Language: en-US
From: TW <dalzot@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev, Mario Limonciello
 <mario.limonciello@amd.com>, Bart Van Assche <bvanassche@acm.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
References: <0e272abe-292d-d58f-cf80-55868e793abc@gmail.com>
 <6b66dd9a-8bd5-2882-9168-8e6e0848c454@leemhuis.info>
 <c70caa9e-164c-fee5-8f85-67f6d02373ab@kernel.org>
 <b0ed86e0-3e4a-d4d1-7b9d-c57f20538a80@gmail.com>
In-Reply-To: <b0ed86e0-3e4a-d4d1-7b9d-c57f20538a80@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I managed to fix the patch file, guess the formatting messed up a bit. 
So will try with those patches installed.

On 7/27/23 04:06, TW wrote:
> I retried on 6.5 rc3 without the Nvidia drivers and still received the 
> same error and going to try for the patch next but got a malformed 
> patch error on line 6 for the first patch for libata-scsi.c. The other 
> two seem to go through just fine however.
