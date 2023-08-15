Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A1919C
	for <regressions@lists.linux.dev>; Tue, 15 Aug 2023 00:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=at/YNp1sTXjMfFJHp9NjljLZGOIZ2zX2T4jq1tox7DI=; b=DEIqSzNGhDjDdnSu/p8BKmWtVT
	g0e2nFLy+OcECGemA8qme0/xm/AAx9lEsQx+g3IiQibP7WK7UxBlGMNYdFvr/89v9izY5WRhE7dRq
	u4xY8snHyY2oZfnWiYkjPlARTIKXbWUMNd4xGIDA+irT9VjtooNH9muUS/AFkBn76yJwX9TgB60+J
	wSWuB7yVrSqh47NIJnsJxwCv31eTsZMhZNJChRPDIQ2AUybxGM5nECC/J1WeWkxACQGPKYngsBxD2
	URMBiRmN49TdMZom4vhw0xwpuRZVU3NiawnAwQuI/V7hcPJbghcuHuwZVidptiN6t9XTOfPWOi00M
	kLr7Kkcg==;
Received: from dg by mx.treblig.org with local (Exim 4.94.2)
	(envelope-from <dg@treblig.org>)
	id 1qVhq1-006xXT-NL; Tue, 15 Aug 2023 00:23:09 +0000
Date: Tue, 15 Aug 2023 00:23:09 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: tytso@mit.edu, adilger.kernel@dilger.ca, song@kernel.org,
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: 6.5.0rc5 fs hang - ext4? raid?
Message-ID: <ZNrFbXw4dhlZsMNJ@gallifrey>
References: <ZNqWfQPTScJDkmpX@gallifrey>
 <ZNrD1BBvDVh-npz4@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ZNrD1BBvDVh-npz4@debian.me>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/5.10.0-23-amd64 (x86_64)
X-Uptime: 00:20:36 up 39 days,  9:52,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.0.5 (2021-01-21)

* Bagas Sanjaya (bagasdotme@gmail.com) wrote:
> On Mon, Aug 14, 2023 at 09:02:53PM +0000, Dr. David Alan Gilbert wrote:
> > Hi,
> >   I'm seeing a few hangs on a fs after upgrading to fedora 39's bleeding
> > edge; which is running kernel 6.5.0-0.rc5.20230808git14f9643dc90a.37.fc39.x86_64
> > It was always solid prior to that.  It seems to trigger on heavy IO
> > on this fs.
> 
> What kernel version prior to this upgrade?

The Fedora 38 kernel, 6.4.10-200.fc38.x86_64  seems happy with the same
userspace as the broken kernel.

> Also, it'd been great if you can also bisect this regression using kernel
> tree obtained with git. See Documentation/admin-guide/bug-bisect.rst in
> the kernel tree for how to perform bisection.

Sure; I can do bisects.

Dave

> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara


-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
