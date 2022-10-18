Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E957B
	for <regressions@lists.linux.dev>; Tue, 18 Oct 2022 01:38:31 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d10so12722566pfh.6
        for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 18:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTN2qy/2Qm3Cw70dkeqCjjtl13hYeoHtMcpkFhAGPg4=;
        b=Ex3v7UqFs94RXJcwwvMbkAGYksXE5bGisSYjN2dEpo2GoM2E6p8/ptfyd6EC7+29my
         wZbyaqmsHfTwQIPpO+mpzVNAwNWPMgHY9Q4Zzhb0hBl6Wi5Y1hoxwob2YQ85LoB/eOJQ
         KbHcKRARsrwGxhD2fRcUI7rMKbc/JHXQsL29Knhn1TiPiHJX+t8CNLESTWD4HQOQf+Nd
         zrhS+Xf8t1OxyRF072ldNS7DY/hGluWNmwfnkioqkZK8Yu25hMrWHmlXdl9D6nba2MYO
         MnrMzzsHm6yyzUw8c7wCIL2mdz6CgGh0DcEN+6+DaXpFxClPdAYIbxWuEVK4Hf8w+GAL
         RO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTN2qy/2Qm3Cw70dkeqCjjtl13hYeoHtMcpkFhAGPg4=;
        b=7ibdKCSZqZpFbLd9O6zrnLxFWi7iZKB+XwtpA1JUQm6mqfxrPh7CHwNtrOEFQgSgi9
         sWH1U4z/FGj3VWGMYWfDtAn8HMPC0KnvmIPwMt9YWgtba/EdrjoKe+qwlyY28FhtxLFq
         Ra0APNkPQoPpTajZCGbmIp6W0TyXph3rkWxWwz+Ur+JR45JDBvJZQMNgEHuc3TyPs5YY
         Tpnhxq9kRmly/7x6detzdNDv7fN8sBPyhWkQoRVz6mdQCUE/IuFaSusobfsHRZGnuhpS
         /d2k/CH1fPv1jpTvNl+A0N6knUIYjAUmBIXkMZ+jiZCsMF1HWwOGG/6itcVygp32NyU9
         cnCw==
X-Gm-Message-State: ACrzQf2WVBlRrWtJdp57PMRJQZvEAStAAe9ZyVTnPPwYofZfuqAk08qz
	mCh1kGneXrn1RVRt+c/eB4A=
X-Google-Smtp-Source: AMsMyM756V46Q8irXvQqiVVGmdO4dWcn23ABv1HPOdALD3Bmccmyvfb7CXTvs7yr+nL4cWPgGCRndw==
X-Received: by 2002:a63:1521:0:b0:43c:9566:7a6a with SMTP id v33-20020a631521000000b0043c95667a6amr560772pgl.339.1666057110889;
        Mon, 17 Oct 2022 18:38:30 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-16.three.co.id. [180.214.232.16])
        by smtp.gmail.com with ESMTPSA id e17-20020a17090301d100b001782398648dsm7352461plh.8.2022.10.17.18.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 18:38:30 -0700 (PDT)
Message-ID: <a606463e-7139-b2d4-e2cf-eef2ec38bf10@gmail.com>
Date: Tue, 18 Oct 2022 08:38:26 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
To: Phillip Lougher <phillip.lougher@gmail.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>, regressions@leemhuis.info,
 mirsad.todorovac@alu.unizg.hr, linux-kernel@vger.kernel.org,
 marcmiltenberger@gmail.com, regressions@lists.linux.dev, srw@sladewatkins.net
References: <8702a833-e66c-e63a-bfc8-1007174c5b3d@leemhuis.info>
 <20221015205936.5735-1-phillip@squashfs.org.uk>
 <2d1ca80c-1023-9821-f401-43cff34cca86@gmail.com>
 <c5980bcb-f345-ff2e-a29b-75e53a6b8708@gmail.com>
 <a1d46bd2-9603-f89a-ec85-ebcd25db8882@gmail.com>
 <CAB3wodeqmuE0iZeSddWSGuJ49rKUjSPb9xxsx189hdL9aMn_pQ@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAB3wodeqmuE0iZeSddWSGuJ49rKUjSPb9xxsx189hdL9aMn_pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/22 00:25, Phillip Lougher wrote:
>> Sorry for speaking late about my triggering cause.
>>
>> As the background, on my Debian 11 computer, I have lxd snap installed.
>> I use lxd to channel my sysadmin side by spinning up containers and
>> installing server applications there (LAMP, email, DNS).
>>
>> Back to triggering cause. I can trigger the regression when the network
>> connection drops (when Firefox shows connection problem page). Then
>> I run `lxd list` to list container instances and I get the Verneed
>> regression error.
>>
> 
> This appears to be both deterministic, and appears to show something
> happening in the Firefox snap triggers an error in the Lxd snap.
> 
> This will then not be a Squashfs issue.  Firefox running in one
> Squashfs filesystem
> can't trigger a failure in another Squashfs filesystem.  This has to be caused
> by something else.
> 

Hi Phillip,

My Firefox runs from upstream tarball (not via snap), so the problem may lie
on snapd itself.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

