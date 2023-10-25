Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BD620
	for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 00:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6LV3SFN"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5ac865d1358so3301286a12.3
        for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 17:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698194417; x=1698799217; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oy3ZCxUaOTBccOyYOfscwNqRTq+2Vm1/fUY8yV/tkg8=;
        b=O6LV3SFNmJBUQFVdvQ+52b3qE+j2AivJveB4F5pqNyvqzavJgJ6hynJyBDzVHgY3EZ
         ILq3IdIQ89m6g7oUw84sdXW6OeU/zwU/i1DW9zv9paCNIjKpXRmbxLN8RRyVPQtMbg+R
         F3w8pQaqynp6LAoCxpUN50uFnewAUaiPz1O9KzdX5uNlS/lcxYTcVzJHkq9SQAwlTwkc
         D7uEFh5D5kBfvcuKuWYgZ74zjPIaz/Z5yO3lx5E1dzn7drysVxWkZesQs5iCSqIpbWRM
         5R4aabdaLqMNunDoQvwM2GY+vnc7IQJYa1mgubow4oiHoGY3eHFjvcYgBk33aPmnN26j
         eieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698194417; x=1698799217;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oy3ZCxUaOTBccOyYOfscwNqRTq+2Vm1/fUY8yV/tkg8=;
        b=FchbA/OrPEPWb7pfp4oibDElveCo5f2pxCcYL4fusxaL80h3YMhnkCYw/Ea3/C/vs1
         QfNRTgygClesKGLtkI82TslyflM+L4fOYbQYiBShHu/cN4P6cZZG3HomOMmsAN0q+EPq
         mMQi1Y7UtONzW4Ud+HhpJu+IRQmN7tgUgWUNE+IRevZTtISGz5gxtYvx8VCvxWpGiqA3
         Km896wU3mhlAhGf3YhiLahmCvvpd2Mk2nIAQkJ7/4uULHXe4h8DjvhBloGtgrOMw14Cj
         sW+aWFJCJDQpRv/qd4aJxo2gL8GLqrgfjtSqPjp5NspOEYxoYE4PyNWtQ+1pvbnNQQTL
         ZFFQ==
X-Gm-Message-State: AOJu0Yx3rSPUjQmPiOvcLbSNL0+qZYYZ4Vrk3cyiMebuG2PGiIR+/auc
	l+DYtLchf9a4YLn0md50R4U=
X-Google-Smtp-Source: AGHT+IGNKaEZC7W8MQaC26f2qUIAnpX/xebK0G7PQ8bDsxQN4pRfDpZ3iswNsTR1vE87PzfChReSdg==
X-Received: by 2002:a05:6a21:7182:b0:17d:ed85:541e with SMTP id wq2-20020a056a21718200b0017ded85541emr4333239pzb.45.1698194417473;
        Tue, 24 Oct 2023 17:40:17 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id ji18-20020a170903325200b001c99b3a1e45sm8024928plb.84.2023.10.24.17.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 17:40:17 -0700 (PDT)
Message-ID: <cd397c88-bf53-4768-9ab8-9d107df9e613@gmail.com>
Date: Wed, 25 Oct 2023 07:40:11 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux IDE and libata <linux-ide@vger.kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Tejun Heo
 <tj@kernel.org>, Totallyreal Name <kotversuchung@gmail.com>,
 loqs <kernel_bugzilla@entropy-collector.net>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: bbbf096ea227607cbb348155eeda7af71af1a35b results in "dirty"
 shutdown
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla that seems to have been
handled already there [1]. Quoting from it:

> I have noticed that after each shutdown SMART would log +1 on each raw_value of drives that count power related issues.
> 
> Here are some of the smart values where i noticed increase among different drives
> 
> POR_Recovery_Count 
> Unexpect_Power_Loss_Ct  
> Power-Off_Retract_Count 
> 
> That doesn't happen on previous Kernels.. and it stops as soon as i switch back to LTS.
> I seeked through the Bug Reports but couldn't really find the issue. So i don't know if this has been reported or patched already.

Another reporter had found the culprit:

> 
> 
> This has been reported as being introduced in stable 6.5.8 [1].  Reverting commit 	bbbf096ea227607cbb348155eeda7af71af1a35b is reported to solve the issue [2]. bbbf096ea227607cbb348155eeda7af71af1a35b [3] is mainline commit aa3998dbeb3abce63653b7f6d4542e7dcd022590 [4] which was introduced in 6.6-rc4 which matches the original report.
> 
> [1]: https://bugs.archlinux.org/task/80064
> [2]: https://bugs.archlinux.org/task/80064#comment223100
> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bbbf096ea227607cbb348155eeda7af71af1a35b
> [4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa3998dbeb3abce63653b7f6d4542e7dcd022590

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: aa3998dbeb3abc https://bugzilla.kernel.org/show_bug.cgi?id=218038
#regzbot title: dirty shutdown due to disabling manage_system_start_stop on SCSI devices
#regzbot link: https://bugs.archlinux.org/task/80064

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218038

-- 
An old man doll... just what I always wanted! - Clara
