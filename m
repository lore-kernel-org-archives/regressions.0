Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC367B
	for <regressions@lists.linux.dev>; Tue, 10 May 2022 03:53:51 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id g184so11129839pgc.1
        for <regressions@lists.linux.dev>; Mon, 09 May 2022 20:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cLBKz/kc2GV9Cb7sj88RNRtLICYKk0ZPvGQRTE6q7WQ=;
        b=29lSw2MYSQ4yj7irgebE4J0SEmFBWwpvP+vvvFG4gM5ff1MeLnkXjyt9gqUKjjK96w
         c0iz2KhSPBDYrS+1DRNFujVhcJh5w7uzQrAD1cmOOi5t+vqE5iov4O59pcn6lmK03Y27
         Uzi97X4Tb5l18ZBs5Peq/fEpfg1SrpAw1QSBM/baMaSNfeuU/EsJAGlpylAMN7egi1Lf
         uLKMRSh4HlvFIMhAsberNLWYkQXYWA90L9+wnlzrmCcaIDWw6EC8qZcHHtxgqnqoE73U
         h+8yEetIjwxPSUA3vQUJWtalLSiXrOtC0yqEzHuRGD9NKyzfrAnaufIcGCADCDkjMuT7
         th3Q==
X-Gm-Message-State: AOAM5306o3kRjPUyffrQW6f0vlDgK6SYgZJlMtHmIzLfLd/cWrTmtpGL
	hgWYMxZXDtFmsz6eoL/db/A=
X-Google-Smtp-Source: ABdhPJxM5t5Vup3WeeJNOD4J8db3k+WIQYjXmqV8Y99eRSM0fVwoEVQLFvD1kP0lsnQVT2VWPVv81g==
X-Received: by 2002:a05:6a00:1acf:b0:50e:1872:c6b1 with SMTP id f15-20020a056a001acf00b0050e1872c6b1mr18707526pfv.76.1652154830348;
        Mon, 09 May 2022 20:53:50 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd? ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
        by smtp.gmail.com with ESMTPSA id b8-20020a62a108000000b0050dc762816fsm9472615pff.73.2022.05.09.20.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 20:53:49 -0700 (PDT)
Message-ID: <4e9d834d-2423-0664-a015-4e55b1535ae2@acm.org>
Date: Mon, 9 May 2022 20:53:47 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Apparent regression in blktests since 5.18-rc1+
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Bob Pearson <rpearsonhpe@gmail.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Bernard Metzler <bmt@zurich.ibm.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <e7c31ebb-60c0-cd57-2009-5e9383ecc472@gmail.com>
 <09333bbb-25b0-031d-a208-a81de34ad6a6@leemhuis.info>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <09333bbb-25b0-031d-a208-a81de34ad6a6@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/22 23:56, Thorsten Leemhuis wrote:
> #regzbot ^introduced v5.17..v5.18-rc6
> #regzbot title rdma: hangs in blktests since 5.18-rc1+
> #regzbot ignore-activity

#regzbot fixed-by: f19fe8f354a6 ("Revert "scsi: scsi_debug: Address 
races following module load"")
