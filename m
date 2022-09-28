Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24367E
	for <regressions@lists.linux.dev>; Wed, 28 Sep 2022 22:38:49 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net [173.48.120.46])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 28SMaNnQ009335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 18:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1664404586; bh=waAn/9TptkPRIHHi0yaeZ4FHiwjtqy03MqfpsbrfLiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aiflh8CWB4z83QjZadi3z6Fg3yVwENag9tSy1Ug1Z4rL08pXqdVQ3o3F9D4Nnn183
	 41QhiwaVVcU0C247awyVjOKevaYCaAS/96gCwabtVY+0VmLsuSm+28u13U2E9cQr2b
	 DcywfjnGFBYDZKSSMiVxRWSVxvD2vobi6HiU13MYqJiLtlriur6aMHdDwc4VWQNAoG
	 ZKfMqTYDTci2/1hv8RwPPmPktHFs+QHV6b48Gl/A+gAzkyDnUSdBsLDrYZXwh0BCWC
	 G9y+Pq9Z4+qHDwhOb42X6tNVNO4bytflVTxBaOgTAqdbK+ZVnNK+b4weE2qrVVlW8n
	 sdnu+DS3UCnpw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 1E5CD15C529A; Wed, 28 Sep 2022 18:36:23 -0400 (EDT)
Date: Wed, 28 Sep 2022 18:36:23 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: "Lu, Davina" <davinalu@amazon.com>
Cc: "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
        "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
        hazem ahmed mohamed <hazem.ahmed.abuelfotoh@gmail.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        "Kiselev, Oleg" <okiselev@amazon.com>,
        "Liu, Frank" <franklmz@amazon.com>
Subject: Re: significant drop  fio IOPS performance on v5.10
Message-ID: <YzTMZ26AfioIbl27@mit.edu>
References: <357ace228adf4e859df5e9f3f4f18b49@amazon.com>
 <1cdc68e6a98d4e93a95be5d887bcc75d@amazon.com>
 <5c819c9d6190452f9b10bb78a72cb47f@amazon.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c819c9d6190452f9b10bb78a72cb47f@amazon.com>

On Wed, Sep 28, 2022 at 06:07:34AM +0000, Lu, Davina wrote:
> 
> Hello,
> 
> My analyzing is that the degradation is introduce by commit
> {244adf6426ee31a83f397b700d964cff12a247d3} and the issue is the
> contention on rsv_conversion_wq.  The simplest option is to increase
> the journal size, but that introduces more operational complexity.
> Another option is to add the following change in attachment "allow
> more ext4-rsv-conversion workqueue.patch"

Hi, thanks for the patch.  However, I don't believe as written it is
safe.  That's because your patch will allow multiple CPU's to run
ext4_flush_completed_IO(), and this function is not set up to be safe
to be run concurrently.  That is, I don't see the necessary locking if
we have two CPU's trying to convert unwritten extents on the same
inode.

It could be made safe, and certainly if the problem is that you are
worried about contention across multiple inodes being written to by
different FIO jobs, then certainly this could be a potential
contention issue.

However, what doesn't make sense is that increasing the journal size
also seems to fix the issue for you.  That implies the problem is one
of the journal being to small, and so you are running into an issue of
stalls caused by the need to do a synchronous checkpoint to clear
space in the journal.  That is a different problem than one of there
being a contention problem with rsv_conversion_wq.

So I want to make sure we understand what you are seeing before we
make such a change.  One potential concern is that will cause a large
number of additional kernel threads.  Now, if these extra kernel
threads are doing useful work, then that's not necessarily an issue.
But if not, then it's going to be burning a large amount of kernel
memory (especially for a system with a large number of CPU cores).

Regards,

					- Ted
