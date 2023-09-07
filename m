Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAB36FD9
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 14:59:51 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bf7a6509deso7771125ad.3
        for <regressions@lists.linux.dev>; Thu, 07 Sep 2023 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694098790; x=1694703590; darn=lists.linux.dev;
        h=in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=urjDqpz6JCoVdXTCwnSCnDwjuGCc92hRjBH5AnvNVH0=;
        b=XlZzF6H/r0uvidUqX+RYpF++IWqqwxtUJDEF++RTd/w0yh5Isxd9KOcu/nZI2WnGSD
         nlP45lJQLYQ3f7bIosBzBfTrLMv+5o3mdrKIss2+WnS/UoKFXLusZZ9NdGkNJj6ORTGR
         ewgbQXrWDukOiCXwXwg63QSP0xL16XcfvkT+gwkoFuAT10JsjMVDDYRPjwo3gxD6z292
         P2V6ZGOb+pniywaiLb5gqBJaOpq1FGsIw1bapt03yZY8SdMPnKNRwjSlC/w0nSW+0/Bf
         PPKDYN16+OkAFrNbJZr4wx2zFz/0A39hMUW2EDQWtbItiJ4qsr6h4t13n5YBitdCHHFM
         EwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694098790; x=1694703590;
        h=in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urjDqpz6JCoVdXTCwnSCnDwjuGCc92hRjBH5AnvNVH0=;
        b=Az9smYLQNE22ReNQQQsCWSPBEZ9G2MZVZ+o/rsq3vaZiTz7B0tc7jDo7yYSHGVVWp1
         CE3XtU0Qin5sOJpgB9aANIoHnIVJXCpQPbDKCrYWyEoS6IpdqcIVLlZ6mJDWt52oTXLH
         /NKblBXe7OSilmdpiclh2TLozcmuQRAe+vsZ9vyMkO1SPp/H6onSPY0PfxY+34bpALdw
         kPJUUSAS98hkpCscdtNoC1czlJMgEvIDqjJmAfACOMfJYVY7cCW5nCHGXkMld++uP9vA
         j2lu51GA53+eVQtfNBFiO/CwURrdT3xdI1bLsZfx3U+MPXIgemKegqIy01wNzLB8igQP
         Vj6g==
X-Gm-Message-State: AOJu0YwuLvq4Jx0BbyAlrkRqFT0GLzGhQE7zh/32g1DJlfdC5xbpKYr6
	A25N1Kf/I69PWc9t5X/+GaE=
X-Google-Smtp-Source: AGHT+IERPfSLD6z/hrsGzfaFdF27geuZZvH21GXJbPEkTHeARJYKwphV4IEmCtpatJ5OII53dYfvZQ==
X-Received: by 2002:a17:902:b490:b0:1c1:e52e:49e3 with SMTP id y16-20020a170902b49000b001c1e52e49e3mr15980676plr.36.1694098790523;
        Thu, 07 Sep 2023 07:59:50 -0700 (PDT)
Received: from dw-tp ([49.207.223.191])
        by smtp.gmail.com with ESMTPSA id n11-20020a170902e54b00b001ba066c589dsm12850300plf.137.2023.09.07.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 07:59:49 -0700 (PDT)
Date: Thu, 07 Sep 2023 20:29:45 +0530
Message-Id: <87o7ie2fmm.fsf@doe.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Theodore Ts'o <tytso@mit.edu>, Zorro Lang <zlang@kernel.org>, linux-ext4@vger.kernel.org, fstests@vger.kernel.org, regressions@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>
Subject: Re: [fstests generic/388, 455, 475, 482 ...] Ext4 journal recovery test fails
In-Reply-To: <ZPnbHhUDkmUQ5906@casper.infradead.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

Matthew Wilcox <willy@infradead.org> writes:

> On Thu, Sep 07, 2023 at 07:05:38PM +0530, Ritesh Harjani wrote:
>> Thanks Matthew for proposing the final changes using folio.
>> (there were just some minor change required for fs/reiserfs/ for unused variables)
>> Pasting the final patch below (you as the author with my Signed-off-by &
>> Tested-by), which I have tested it on my system with "ext4/1k -g auto"
>
> I'd rather split that patch up a bit -- I don't think the reiserfs
> part fixes any actual problem.  I've pushed out
> https://git.infradead.org/users/willy/pagecache.git/shortlog/refs/heads/bh-fixes
>
> or git clone git://git.infradead.org/users/willy/pagecache.git
>
> I credited you as the author on the second two since I just tidied up
> your proposed fixes.
>
> I've also checked ocfs2 as the other user of JBD2 and I don't see any
> problems there.

Thanks Matthew! :) 

-ritesh 
