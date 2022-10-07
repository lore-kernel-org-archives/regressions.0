Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6FA4E
	for <regressions@lists.linux.dev>; Fri,  7 Oct 2022 08:47:10 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id y20so2426128qtv.5
        for <regressions@lists.linux.dev>; Fri, 07 Oct 2022 01:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sladewatkins.net; s=googled;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBnpp0sDJqctU48vfQ6g+lgvjUgr8EqGIShTt9dMo7I=;
        b=So2mOLRiFPO4IrylFWHZWJJk/3VXaTt2NPyoMnQ5A3MepDesWCkQbV6kUONBwbp232
         lG23uhlEW9IjaW7lW6hmc0DEHQTJMmBU0UOFaKkziWQVFH7o2+MLVrIstILajKZWGz+i
         7M1JHWf62GONh83LthHWw3fAHZjJ3kGzFUcQBjpekK3TOb/11+Ncnd1H3lqn5HuAARym
         E3wyfIFV5lf+NPBJ8cT31Am1RW7D0tvG8cTfM1dl/w+h3qud3QjszwpFXmCpf+ndyr2N
         gU5lri5hlIwyKffYK49ovERz570NCZbJhGcip6cV7TI4W/qmdu8WqbPVxElyJ2bCFZuo
         5I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBnpp0sDJqctU48vfQ6g+lgvjUgr8EqGIShTt9dMo7I=;
        b=x5dppDJT5qFe3STl1G6txizdzSTN6HBnfzB9GBr1Xm+x6PkFCRaEct+xLBFiwaRKQG
         4mlqLHdaExfs1rQixdRRD1YKRDuSd+qh9oNJl8p2d7oLcqhZ4GFlnjykATz8Ci9GPQPb
         AYxcs9oTbpFThwcd5VrF0EV6OC3C8JzaJiLqfU1Ql9aLa4Pdh0kllzWGJFoHU/AhVtOR
         ZqpPHhqFxdFHBYXXsZ/L8hsFsw8WHQC96M5NZjJTouXrDvB2gbLiLlZkmKImPEB9cppp
         S5aBTeJMTn8haP8HxeRQgoMzaeXLrB4+GXgfdZzBJEFRmeYkrSUgX6VJGejKAbZavtz4
         KK8w==
X-Gm-Message-State: ACrzQf0gYTNW2DFCtjG2vwH4v3+Hxby3UbosDi0URcwEvof/BgKGRqvO
	/t0G673612NbDM5zO5PRosy3IQ==
X-Google-Smtp-Source: AMsMyM4DqMy2+MvS3ZdxcUPmFL9ihfz/PmQXU0cbt3KGiIblWWdaITB4N/ws3HzghR2EK3ZWvOExmg==
X-Received: by 2002:a05:622a:58c:b0:394:d520:dba0 with SMTP id c12-20020a05622a058c00b00394d520dba0mr3375330qtb.664.1665132429281;
        Fri, 07 Oct 2022 01:47:09 -0700 (PDT)
Received: from [192.168.1.30] (pool-108-4-135-94.albyny.fios.verizon.net. [108.4.135.94])
        by smtp.gmail.com with ESMTPSA id k11-20020a05620a0b8b00b006cbc6e1478csm1474410qkh.57.2022.10.07.01.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 01:47:08 -0700 (PDT)
Message-ID: <43d5fd3c-dbe3-6090-8a56-c2ffb1f00e0d@sladewatkins.net>
Date: Fri, 7 Oct 2022 04:47:07 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: BUG: 6.0.0-RC kernels trigger Firefox snap bug with 6.0.0-rc3
 through 6.0.0-rc7
Content-Language: en-US
To: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev,
 regressions@leemhuis.info
References: <b0c258c3-6dcf-aade-efc4-d62a8b3a1ce2@alu.unizg.hr>
 <1266113f-75a1-b276-bb8c-3cdfcbabf043@alu.unizg.hr>
 <47CFBECB-AE3D-4252-972D-933D2DF4A8EB@sladewatkins.net>
 <77bc5046-7b69-6100-f991-60b4d53994ee@alu.hr>
 <0BD28445-7393-4153-B15C-59E5DA868E80@sladewatkins.net>
 <2F9EDCCA-AB85-44CE-AD9F-44394C8663B8@sladewatkins.net>
 <254f0b04-428e-cad8-02e3-0224b798b060@alu.unizg.hr>
From: Slade Watkins <srw@sladewatkins.net>
In-Reply-To: <254f0b04-428e-cad8-02e3-0224b798b060@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey Mirsad,

On 10/3/22 at 4:18 AM, Mirsad Goran Todorovac wrote:
> 
> I'm sorry you couldn't reproduce the bug. I will try to provide the list of the installed pkgs the
> next time, for both configs
So, I'm able to reproduce this now on Ubuntu 22.04 with 6.0 mainline. Unfortunately, I won't be able to bisect and send that info to Thorsten and the Regressions list until Monday afternoon most likely. Both are Cc'd on this update.

[+Thorsten, +Regressions List]

Best,
-srw
