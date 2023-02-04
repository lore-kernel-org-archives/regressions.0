Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C31FD0
	for <regressions@lists.linux.dev>; Sat,  4 Feb 2023 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675516560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4UloaC8p+3e6sJ8izpr2qKf2jUP+gRvxvgLL5VJAzCM=;
	b=KdU6lo5YDPLs9WPNZdhLzbnQRAe4+X3BcIa1ZsQuPzJ3xEBDq9p0+Xu+ouFHP1hXps6+Xv
	fsgBOU21uaSQ76pnKth00hqsSwDmMa5xzC2ZP24gkgH5C3Q8Ek7JBnKZENlJIgyDJ6vcMS
	b1WrpgAEfeMrJ36CqdRqaQ+6VdygYII=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-_4FVVWJTMZqYICkYfs1-iw-1; Sat, 04 Feb 2023 08:15:57 -0500
X-MC-Unique: _4FVVWJTMZqYICkYfs1-iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 513D1802314;
	Sat,  4 Feb 2023 13:15:56 +0000 (UTC)
Received: from [172.16.176.1] (unknown [10.22.50.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F8C6C15BA0;
	Sat,  4 Feb 2023 13:15:54 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Trond Myklebust <trondmy@hammerspace.com>,
 Hugh Dickins <hughd@google.com>,
 Charles Edward Lever <chuck.lever@oracle.com>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Anna Schumaker <anna@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: git regression failures with v6.2-rc NFS client
Date: Sat, 04 Feb 2023 08:15:52 -0500
Message-ID: <15679CC0-6B56-4F6D-9857-21DCF1EFFF79@redhat.com>
In-Reply-To: <c5259e81-631e-7877-d3b0-5a5a56d35b42@leemhuis.info>
References: <9A4A5673-691D-47EC-BC44-C43BE7E50A48@oracle.com>
 <D0404F55-2692-4DB6-8DD6-CAC004331AC1@redhat.com>
 <5FF4061F-108C-4555-A32D-DDBFA80EE4E7@redhat.com>
 <F1833EA0-263F-46DF-8001-747A871E5757@redhat.com>
 <B90C62F2-1D3A-40E0-8E33-8C349C6FFD3D@oracle.com>
 <44CB1E86-60E0-4CF0-9FD4-BB7E446542B7@redhat.com>
 <1AAC6854-2591-4B21-952A-BC58180B4091@oracle.com>
 <41813D21-95C8-44E3-BB97-1E9C03CE7FE5@redhat.com>
 <79261B77-35D0-4E36-AA29-C7BF9FB734CC@oracle.com>
 <104B6879-5223-485F-B099-767F741EB15B@redhat.com>
 <966AEC32-A7C9-4B97-A4F7-098AF6EF0067@oracle.com>
 <545B5AB7-93A6-496E-924E-AE882BF57B72@hammerspace.com>
 <FA8392E6-DAFC-4462-BDAE-893955F9E1A4@oracle.com>
 <4dd32d-9ea3-4330-454a-36f1189d599@google.com>
 <0D7A0393-EE80-4785-9A83-44CF8269758B@hammerspace.com>
 <ab632691-7e4c-ccbf-99a0-397f1f7d30ec@google.com>
 <8B4F6A20-D7A4-4A22-914C-59F5EA79D252@hammerspace.com>
 <c5259e81-631e-7877-d3b0-5a5a56d35b42@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

On 4 Feb 2023, at 6:07, Thorsten Leemhuis wrote:

> But as you said: people are more likely to run into this problem now.
> This in the end makes the kernel worse and thus afaics is a regression,
> as Hugh mentioned.
>
> There sadly is no quote from Linus in
> https://docs.kernel.org/process/handling-regressions.html
> that exactly matches and helps in this scenario, but a few that come
> close; one of them:
>
> ```
> Because the only thing that matters IS THE USER.
>
> How hard is that to understand?
>
> Anybody who uses "but it was buggy" as an argument is entirely missing
> the point. As far as the USER was concerned, it wasn't buggy - it
> worked for him/her.
> ```
>
> Anyway, I guess we get close to the point where I simply explicitly
> mention the issue in my weekly regression report, then Linus can speak
> up himself if he wants. No hard feeling here, I think that's just my duty.
>
> BTW, I CCed the regression list, as it should be in the loop for
> regressions per
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> BTW, Benjamin, you earlier in this thread mentioned:
>
> ```
> Thorsten's bot is just scraping your regression report email, I doubt
> they've carefully read this thread.
> ```
>
> Well, kinda. It's just not the bot that adds the regression to the
> tracking, that's me doing it. But yes, I only skim threads and sometimes
> simply when adding lack knowledge or details to decide if something
> really is a regression or not. But often that sooner or later becomes
> clear -- and then I'll remove an issue from the tracking, if it turns
> out it isn't a regression.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

Ah, thanks for explaining that.

I'd like to summarize and quantify this problem one last time for folks that
don't want to read everything.  If an application wants to remove all files
and the parent directory, and uses this pattern to do it:

opendir
while (getdents)
    unlink dents
closedir
rmdir

Before this commit, that would work with up to 126 dentries on NFS from
tmpfs export.  If the directory had 127 or more, the rmdir would fail with
ENOTEMPTY.

After this commit, it only works with up to 17 dentries.

The argument that this is making things worse takes the position that there
are more directories in the universe with >17 dentries that want to be
cleaned up by this "saw off the branch you're sitting on" pattern than
directories with >127.  And I guess that's true if Chuck runs that testing
setup enough.  :)

We can change the optimization in the commit from
NFS_READDIR_CACHE_MISS_THRESHOLD + 1
to
nfs_readdir_array_maxentries + 1

This would make the regression disappear, and would also keep most of the
optimization.

Ben

