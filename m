Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1902F1170E
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 14:00:55 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68e3083aa1dso4326714b3a.1
        for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 07:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694440855; x=1695045655; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2Q+4HmWdmD9If9N6/Rge7uDA1fBSwpfjskqILwBtyY=;
        b=WZiHT8EXx2k9XsOPXY2kfdz62MKNFqlJKpC7JSR9fNqHeTOiZvql2G+5Dbuh1u+WW5
         f7vuR/knmDygljk/fcd8sD5nzCMg7bl38bdc0N2rZDsqdXd58prnzTEFDFGT7EubFkXQ
         H3Nr1/pz1LBU1H1XuQNbw2yHXncEb7hy34j0IzvISz3jMaNrrP9oKScV6wdgNtF26VV9
         rtLYZJqgGo+CxJ0NlTj09pHc79AH4hPJ7JDjs5SkjFLohHq9Zk2jzcAi0xuafHEW3Qnj
         LoKnF9PgkV67x6H5uVjDEXJB019cyjXWRHi4WcTFrd5Y4c/jsySccgkaAuhASPtPV6bA
         USNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694440855; x=1695045655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u2Q+4HmWdmD9If9N6/Rge7uDA1fBSwpfjskqILwBtyY=;
        b=vm/DeupoyyuCEYqK2WTJcvZNExNSBQXc/Qrv+dctMwp+Qn8X3AR7MSYkae68qGxSPF
         j65YhZnSbP7US5NQqTS9+OSs0kEu+hLlS1b4s6V8AwZeqb5p2PPxxYiBhA5saKpBmOvN
         k+WBWFW54qqO2pr8LoNem47raNo/+i1Ey7oM1dL0ChMo1xXeOLevYxOVxhAODhzlM2j3
         pxMX0nuubfyvtmNcKk20qP2S40nXsvlrCvaaR4WfIkDt09Cm97lYU2YZHw1DuIoXWT7L
         0vfgIYK32ByqZejqTNv6FJruUxqdkd/kUIfllBRrt2UTOdPtC+6Krt2wL2KfFD6rqoK/
         0GpA==
X-Gm-Message-State: AOJu0Ywdx2EYOappft9BAUzm+PbGP81XCFbMP0ybcccOgMTbSt6x2zB3
	DJ+vayDqocR3MXNseYYw3ZA=
X-Google-Smtp-Source: AGHT+IF+5c9+fQ4xKQsvS/HkkOz8hj7VmzC06mn57xXfwBGYWcR9O0Oc90MXkr1cUCqA0/oKcvITYA==
X-Received: by 2002:a05:6a20:e11b:b0:140:6d68:ce07 with SMTP id kr27-20020a056a20e11b00b001406d68ce07mr13423508pzb.52.1694440855159;
        Mon, 11 Sep 2023 07:00:55 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id k17-20020aa78211000000b00682d79199e7sm5586494pfi.200.2023.09.11.07.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 07:00:54 -0700 (PDT)
Message-ID: <9a8d2090-a58e-49a0-3b1d-00bb5b8f04f2@gmail.com>
Date: Mon, 11 Sep 2023 21:00:49 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: Slow boot and shutdown/reboot problems with 6.5.0+
To: Marcus Seyfarth <m.seyfarth@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russell.h.weight@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Integrity <linux-integrity@vger.kernel.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
References: <5011708f-b0ae-2853-0f87-a3b59845a2cc@gmail.com>
 <CA+FbhJO8b5V_So2mMPu1ApKXTxk0ieWvNMa=HBTYTWDXLEA-ew@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CA+FbhJO8b5V_So2mMPu1ApKXTxk0ieWvNMa=HBTYTWDXLEA-ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/09/2023 20:56, Marcus Seyfarth wrote:
> As to bisecting: Unfortunately I cannot afford the time right now to bisect this further as the system is used in production and already did invest a lot of time without success into it. Hopefully someone else can find the root cause of the problem. My systemd version is: 254.1, and I also use dbus 1.14.10 and dbus-broker 33.r35.g2220a84 which was configured with -D linux-4-17=true.
> 

[also Cc: Thorsten]

To Thorsten: It looks like the reporter can neither bisect nor
test the mainline since he only has production machine instead.
What can I (and the reporter do) in this case?

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

