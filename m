Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC27E1E
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 02:42:08 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net [173.48.120.46])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 28L2fupT001976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 22:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1663728119; bh=t2Q8V+AEIFSC4FWyOVVZ3q/0L0fosOQqOKm2sowUgLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DBiS/xxerukulQL4UwQIAmdTUPF9ZSkwh0fPFFq45tIbzNTTWEtxhAsfkEW70KQS6
	 qVQtcbPI6J+lJlpLcMN+MNpep3yeA+QiSlt78GuRjpM0NlbsRU7CUd8lClb5b+pepC
	 DSS5we2t7YAFaleOQHG9zF1rC1W0QjD9Q0SMXgAHw2PHxAHAvVY8VlEORVR60ahCKx
	 r9VUo+eHY2Tjmw1u8rvxxTfK//3CQeIm7I52ipSmSoYVorRjTXvjyhmM9IYSb+90KY
	 ESIQQzwUFtn0JUDdW51LtlAvo1Y+u1sCQeYNRMUINshuUyBZAmigOj0rBhBZeJUCU6
	 5zAPxOdZN1BPg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id C6C2515C526C; Tue, 20 Sep 2022 22:41:56 -0400 (EDT)
Date: Tue, 20 Sep 2022 22:41:56 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: hazem ahmed mohamed <hazem.ahmed.abuelfotoh@gmail.com>,
        "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
        "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>
Subject: Re: Ext4: Buffered random writes performance regression with
 dioread_nolock enabled
Message-ID: <Yyp59DELlYXpoCBC@mit.edu>
References: <CACX6voDfcTQzQJj=5Q-SLi0in1hXpo=Ri28rX73Og3GTObPBWA@mail.gmail.com>
 <48bb6266-2d5c-ffcd-6982-4fd02bfdcfc3@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48bb6266-2d5c-ffcd-6982-4fd02bfdcfc3@leemhuis.info>

Hazem started separate e-mail threads on this issue (separated by
about an hour), and I replied to the earlier one here:

    https://lore.kernel.org/all/Yypx6VQRbl3bFP2v@mit.edu/

TL;DR:

1)  The patch landed in 5.6, and improved performance for some
workloads, and also fixed a potential security problem (exposure of
stale data caused by a race).

2)  If you are using a storage device >= 128GB, and a version of
e2fsprogs v1.43.2 (released six years ago), the journal size will be
1GB, which Hazem reported resolved the problem.

3) I disagree that we should revert this commit, as it only changes a
default.  If you prefer the older behavior, you can change it with a
mount option.

						- Ted
