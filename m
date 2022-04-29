Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9C1110B
	for <regressions@lists.linux.dev>; Fri, 29 Apr 2022 14:30:20 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id o69so5913754pjo.3
        for <regressions@lists.linux.dev>; Fri, 29 Apr 2022 07:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iZlmV64Xc1hWa8wSScKbyiAr5Rslu8TBnEqFBv07zwg=;
        b=6QUydy7iv6PRdcj26+d1gMPzOpoSdE+IkxWjg8dVSQdcNj43QSyvI+TvAW3xj4jVR+
         p+plnYLdv4OkUt3knzSxXBsUI3F01VOoM9Q1N6O5BgxC+nis1vnayR/PZO6vPHEDkX7N
         8yHqyRqoYQYQZU29Lx3/Rrt+F6wENmq0SwVsTw5Oxg39W5wq730zsOTmkhanPLz9aBXM
         ANh6X7TFYXF4f4GJrvnDBYKUs0dKIQExldwuuePcavClVZ1I3d4+8MUiWJnbZBnl5//H
         OBV5GBSGQgLJMNbbvokMnaOj22ReXTLZQ66rgDvXVf2F0rzd1jGZ94k51fPSwIwVhdJD
         4ZmA==
X-Gm-Message-State: AOAM533YojKsbw2c5iOqw3egzQFJmjWOCurwwQvSEE+XTXYnonN2Nr3p
	rHyjzgGEbPE7ihMv51+0VE8=
X-Google-Smtp-Source: ABdhPJzTJp2fn8qvZQAtR6g5cDj2ky9bT3FB9Vi/zQEh7h/46+nv9XGS+bRccXwuIwR1ZcJBgpncRQ==
X-Received: by 2002:a17:902:e80e:b0:15d:34d2:4e8c with SMTP id u14-20020a170902e80e00b0015d34d24e8cmr19949517plg.142.1651242620075;
        Fri, 29 Apr 2022 07:30:20 -0700 (PDT)
Received: from [192.168.51.14] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id d6-20020a17090ac24600b001d9738fdf2asm14302675pjx.37.2022.04.29.07.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 07:30:19 -0700 (PDT)
Message-ID: <9866c2ab-469f-bc87-8510-05dd9af07a84@acm.org>
Date: Fri, 29 Apr 2022 07:30:18 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Regression] Resume process hangs for 5-6 seconds starting
 sometime in 5.16
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
References: <81b865bb-be46-cdf7-a49b-fd029de439fb@leemhuis.info>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <81b865bb-be46-cdf7-a49b-fd029de439fb@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/22 05:24, Thorsten Leemhuis wrote:
> Bart, I noticed a regression report in bugzilla.kernel.org that afaics
> nobody acted upon since it was reported about a week ago, that's why I
> decided to forward it to the lists and all people that seemed to be
> relevant here. It's caused by a commit of yours. To quote from
> https://bugzilla.kernel.org/show_bug.cgi?id=215880 [ ... ]

Thanks Thorsten for having informed me about this issue. I was not yet 
aware of this issue but will take a look as soon as I can (next week is 
LSF/MM).

Bart.
