Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED963D1
	for <regressions@lists.linux.dev>; Mon, 21 Nov 2022 15:40:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4590921AB1;
	Mon, 21 Nov 2022 15:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1669045249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PcfepNWTvOXysC6fXh1QuniRbBFvGDhnqa0/pAPOEmM=;
	b=I1moyzKYxqa7I+rF1PEQm+i74T7vzz3f429x0FZduxIRrqFjV5IZq0+ocehYa71byKhj8F
	7wi6K6BDsvvJh4SNRv/QuKFwKPMUZMBhDYu886L0hNr4ckTkInMjAy8JaGohbK/qoK005w
	BnG36AN2Dl5DcDrD7Dlc+6yCnnPRNEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1669045249;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PcfepNWTvOXysC6fXh1QuniRbBFvGDhnqa0/pAPOEmM=;
	b=8Wp/z2Psux05Y3bk7hc+b/5cHGO6RgsNwblTAl4FeoqI4hFeEpqAhTLlGB7IOYNeF6iioZ
	sUvRMDH21PgSTDCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 371521376E;
	Mon, 21 Nov 2022 15:40:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7z5oDQGce2MWRwAAMHmgww
	(envelope-from <jack@suse.cz>); Mon, 21 Nov 2022 15:40:49 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id C2A36A070A; Mon, 21 Nov 2022 16:40:48 +0100 (CET)
Date: Mon, 21 Nov 2022 16:40:48 +0100
From: Jan Kara <jack@suse.cz>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jan Kara <jack@suse.cz>,
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
	Thilo Fromm <t-lo@linux.microsoft.com>, Ye Bin <yebin10@huawei.com>,
	jack@suse.com, tytso@mit.edu, linux-ext4@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [syzbot] possible deadlock in jbd2_journal_lock_updates
Message-ID: <20221121154048.iccqmx7zajhxh4aq@quack3>
References: <20221026101854.k6qgunxexhxthw64@quack3>
 <20221110125758.GA6919@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20221110152637.g64p4hycnd7bfnnr@quack3>
 <20221110192701.GA29083@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20221111142424.vwt4khbtfzd5foiy@quack3>
 <20221111151029.GA27244@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20221111155238.GA32201@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20221121133559.srie6oy47udavj52@quack3>
 <20221121150018.tq63ot6qja3mfhpw@quack3>
 <a98303db-85df-a64d-d672-c16d1e0d8b49@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a98303db-85df-a64d-d672-c16d1e0d8b49@leemhuis.info>

On Mon 21-11-22 16:18:09, Thorsten Leemhuis wrote:
> On 21.11.22 16:00, Jan Kara wrote:
> > OK, attached patch fixes the deadlock for me. Can you test whether it fixes
> > the problem for you as well? Thanks!
> 
> Jan, many thx for taking care of this. There is one small thing to
> improve, please add the following tags to your patch:
> 
> Link:
> https://lore.kernel.org/r/c77bf00f-4618-7149-56f1-b8d1664b9d07@linux.microsoft.com/
 
Good point. Thanks, added!

> Not sure, maybe a reported-by for Syzbot would be good as well, see:
> https://lore.kernel.org/linux-ext4/000000000000892a3005e5b5d96c@google.com/

The syzbot report is actually unrelated. So far I think that the bisection
that landed guys on the same commit as syzbot was just luck or maybe change
in timing that made the problem easier to reproduce. 

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
