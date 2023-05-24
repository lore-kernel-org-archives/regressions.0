Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B122627
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 22:12:29 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-75b1975ea18so17816685a.3
        for <regressions@lists.linux.dev>; Wed, 24 May 2023 15:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684966349; x=1687558349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1l/0qie4req/UQOwYfmZHsuT9joQERFp9mtBgi/+Sw=;
        b=kzGFFuKKMv1z86PsXNNkYryChfRTphcbuWNHNVkz3R6lAcch1+7gBETZMR9o38Tuee
         sD2G6QJlCAHU5qiKQKniZ3nw5RIMowXPiP1Ng2lF7KriLKBJppYjfY95uecdT2BQqSyG
         +BpWFAowI7S0RQ+d8x3ks1ijVBoLWdcZBJNlq2AkzCrqAsvGMGa9d0Pm31Wjcs3jekzp
         xO15/I72IuK3EWOJV3IsxTuu0X8+mpKvj+7YbtSFlfdkPENT/MH1WBxco6D2e54h6lIJ
         02SDfJ/HLu8CbMU7xVpEv1DkZTVKFz87NTLLvUlO1vo6YmPKChswf5S8q4LzI8pd3Sq4
         LvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684966349; x=1687558349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1l/0qie4req/UQOwYfmZHsuT9joQERFp9mtBgi/+Sw=;
        b=CukCnFxSwJVkzL/VeIRERbp177NwAQRZyU2nQNaKmLPKM8fMGH/sE3/UxcDydWvAGs
         PWZgigBbXlfR36ej+x3jsOZ6YbWhxChTxlSOAZu0hyj5lRp539rx74TtKmyCVrpXZXNM
         +aXiAgfTBnmPEkUiNwwsow8wI5EsqUgxzFqI+Ip/HBOmwYdsLr9IQ4nl5WN/8AInY57E
         Z09ZDPPd7DnQxwu4cZfyP9RzdigWF1zXYrm46pDaVVb1jaqHa3YErfSg5Q4xxMpmrsah
         OV0KHOCFYH19Lnyx1zyF1tYIHT6UQRae+dGVC3VNW/8+Jn1voEqlmvQidO1Tap5SWyiX
         dApg==
X-Gm-Message-State: AC+VfDyDBAL+Cfs4eJJMKKHOhSv42t5BSck+y1W6d9UDztmlypWDwaE4
	1s3OPo+Z+xY31U78sghER1I=
X-Google-Smtp-Source: ACHHUZ4LQl+sMom57SWJGat+dzZZHusXYWow4q9mi5ixXb7ZlaxbQEy8LL0FryAMBB6fCDIPDIoN5Q==
X-Received: by 2002:a05:620a:3d89:b0:75b:23a0:e7b8 with SMTP id ts9-20020a05620a3d8900b0075b23a0e7b8mr7648120qkn.25.1684966348958;
        Wed, 24 May 2023 15:12:28 -0700 (PDT)
Received: from debian-BULLSEYE-live-builder-AMD64 (h64-35-202-119.cntcnh.broadband.dynamic.tds.net. [64.35.202.119])
        by smtp.gmail.com with ESMTPSA id u13-20020ae9c00d000000b0075783f6c2b4sm3550775qkk.128.2023.05.24.15.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 15:12:28 -0700 (PDT)
Date: Wed, 24 May 2023 18:12:26 -0400
From: Eric Whitney <enwlinux@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Ted Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
	Eric Whitney <enwlinux@gmail.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] ext4: Fix fsync for non-directories
Message-ID: <ZG6Lyq4iq/HnBvPu@debian-BULLSEYE-live-builder-AMD64>
References: <20230524104453.8734-1-jack@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524104453.8734-1-jack@suse.cz>

* Jan Kara <jack@suse.cz>:
> Commit e360c6ed7274 ("ext4: Drop special handling of journalled data
> from ext4_sync_file()") simplified ext4_sync_file() by dropping special
> handling of journalled data mode as it was not needed anymore. However
> that branch was also used for directories and symlinks and since the
> fastcommit code does not track metadata changes to non-regular files, the
> change has caused e.g. fsync(2) on directories to not commit transaction
> as it should. Fix the problem by adding handling for non-regular files.
> 
> Fixes: e360c6ed7274 ("ext4: Drop special handling of journalled data from ext4_sync_file()")
> Reported-by: Eric Whitney <enwlinux@gmail.com>
> Link: https://lore.kernel.org/all/ZFqO3xVnmhL7zv1x@debian-BULLSEYE-live-builder-AMD64
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/ext4/fsync.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/ext4/fsync.c b/fs/ext4/fsync.c
> index f65fdb27ce14..2a143209aa0c 100644
> --- a/fs/ext4/fsync.c
> +++ b/fs/ext4/fsync.c
> @@ -108,6 +108,13 @@ static int ext4_fsync_journal(struct inode *inode, bool datasync,
>  	journal_t *journal = EXT4_SB(inode->i_sb)->s_journal;
>  	tid_t commit_tid = datasync ? ei->i_datasync_tid : ei->i_sync_tid;
>  
> +	/*
> +	 * Fastcommit does not really support fsync on directories or other
> +	 * special files. Force a full commit.
> +	 */
> +	if (!S_ISREG(inode->i_mode))
> +		return ext4_force_commit(inode->i_sb);
> +
>  	if (journal->j_flags & JBD2_BARRIER &&
>  	    !jbd2_trans_will_send_data_barrier(journal, commit_tid))
>  		*needs_barrier = true;
> -- 
> 2.35.3
>

Hi Jan:

100/100 trials of both the original test regressions - generic/065 and
generic/535 - passed when I used kvm-xfstests to run them on a 6.4-rc3 kernel
modified with this patch.  A complete run of the adv test case also passed
without new regressions.

So,
Tested-by: Eric Whitney <enwlinux@gmail.com>

Thanks!
Eric

