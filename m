Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAE11B908
	for <regressions@lists.linux.dev>; Tue, 23 May 2023 06:08:38 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2532c2c419dso4858158a91.0
        for <regressions@lists.linux.dev>; Mon, 22 May 2023 23:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684822118; x=1687414118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VD2NgqcZRGGkn3zZ0rm+CVjM7qWx3oRiSvs0S669pNg=;
        b=X/YpLW2vAC2Hl35lGL1TaWkJI8riIDWIIOsHjGi1oTVPmp2DvvXQAd+hKHRY4OP/K6
         538YR277Mf1WyxOgZQXhbt6KWQw8GKbtTQkTyzwO7hVYNMes5AkbnZRo2kjSTgMKxkFj
         +AMkMpG4oUNjYQh0epqP7LJDi+ogORP6cjmFcanl58d+yTnIbC/aQDYNOhydZhPUXxLw
         CSsr2Im8/e40kJ02RDD1m2u5OPlvPv4Lr95UhMrt0cEPRqvVMaq7YINHRGyfrCzJUHpG
         bZuqzDYe6EuISXglPbizWoTkFK2ZnwzSSNcpwkyaSWbH7vheoqkCvKMIOD9Vkl8bFtWn
         Xymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684822118; x=1687414118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VD2NgqcZRGGkn3zZ0rm+CVjM7qWx3oRiSvs0S669pNg=;
        b=ZQPM2WFJt+xTdwZ8ARThwkiJgwW6aRyqJte7E/yOAMk6XurXVMnQ2PUzbNZBAgXdon
         cIXkuGHtOK4yTtaPAzCzA6NUUmkRXc3rgaGnloE2LKrgOrmxRa6o4F9pUwIAoPBbq00Y
         szSaq5PHSSny5aeq9MVBKwmsuuvEjG9GGuYcq4dGwE2rfx6NYHXtLdU22y7N5NLrJeG/
         Gx3wN/ntk3pZvuXLBfTCDMrPrTKRZ5FaVtqLqU7hW/DTqMfBR9LjC4h89LRyOidookPw
         EHjvsmbuVqNZk6ZT6vaZiqoNVXGn/D6cBVHtNUtA1S4EZl2WlCB89eCk7eF9eHPODsMs
         wGbA==
X-Gm-Message-State: AC+VfDwTyRk0RmUKiHWm5jZiT7xXHdabXL17WrsHb1HN+9irNP73/ktJ
	K4vJOSMa7OunEgLKfIeGViNHL8HnMZg=
X-Google-Smtp-Source: ACHHUZ4Re4MPQH5TgNZeGn6nxPZBW6jCrkNdY6dqjmYEynVdIl8jZ2BK7fz2RlAjm+2R3PREVyKKQQ==
X-Received: by 2002:a17:902:ea8a:b0:1ae:2b95:7125 with SMTP id x10-20020a170902ea8a00b001ae2b957125mr11543487plb.63.1684822117737;
        Mon, 22 May 2023 23:08:37 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-59.three.co.id. [116.206.12.59])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902a3c700b001ab39cd875csm5930111plb.133.2023.05.22.23.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 23:08:37 -0700 (PDT)
Message-ID: <89b7cfee-164a-470e-c375-73b109fdf214@gmail.com>
Date: Tue, 23 May 2023 13:08:32 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Syzkaller & bisect] There is BUG: unable to handle kernel NULL
 pointer dereference in xfs_extent_free_diff_items in v6.4-rc3
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 "Darrick J. Wong" <djwong@kernel.org>
Cc: Pengfei Xu <pengfei.xu@intel.com>, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, heng.su@intel.com, dchinner@redhat.com,
 lkp@intel.com
References: <ZGrOYDZf+k0i4jyM@xpf.sh.intel.com> <ZGsOH5D5vLTLWzoB@debian.me>
 <20230522160525.GB11620@frogsfrogsfrogs>
 <aa3fcf2f-013b-358f-e2d3-205e40b6908a@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <aa3fcf2f-013b-358f-e2d3-205e40b6908a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/23 00:05, Linux regression tracking (Thorsten Leemhuis) wrote:
> Darrick, sorry for the trouble. Bagas recently out of the blue started
> to help with adding regressions to the tracking. That's great, but OTOH
> it means that it's likely time to write a few things up that are obvious
> to some of us and myself.
> 
> Bagas, please for the foreseeable future don't add regressions found by
> syzkaller to the regression tracking, unless some well known developer
> actually looked into the issue and indicated that it's something that
> needs to be fixed.
> 
> Syzbot is great. But it occasionally does odd things or goes of the
> rails. And in can easily find problems that didn't happen in an earlier
> version, but are unlikely to be encountered by users in practice (aka
> "in the wild"). And we normally don't consider those regressions that
> needs to be fixed.
> 

Oops, at the moment I didn't know how to distinguish true regressions
and issues found by the bot, so I thought that both are regressions.

Thanks for the tip!

-- 
An old man doll... just what I always wanted! - Clara

