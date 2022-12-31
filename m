Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572AE7E
	for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 02:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB09C433D2;
	Sat, 31 Dec 2022 02:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672455066;
	bh=0A42kWkIs381juGuLpCG9DoytaGwDUdX7uyHrnK1/SM=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=OR6sYtogoecFKH1Lqk1l7qtiTfHpuGgWLVZqMEO+W8fUTaSN9aT3kHNsDmAf9FL3I
	 4JYhdZES+cRYjqX+nMmP3+HLfqOTcLGIZUP5w9NbrwBorpX70WrY80GA9CrbO5g/e4
	 k9/Xu8Q574jMJyNjjeky22v7PESePViY1+FYXOxX1XmyWQ/hEC8r+IRUOM5GV8s2QP
	 CPzoSSDmrK6HEEbrc+2ZO8XdVDSOGRWzNc7IDFqacBttgbL84wmgta8p+zstxWRexf
	 iX86806B09kdxhidEWAI3z4hfgjRxuc8OzQj9Fu6ROCmayuzkg8gXcm2CeGrvKlDmV
	 +MkeCwRLY6XLQ==
Message-ID: <3dd9808e-ffbd-7959-2111-a9f13f2031f1@kernel.org>
Date: Sat, 31 Dec 2022 10:51:01 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jeff Chua <jeff.chua.linux@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Eric Biggers <ebiggers@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 F2FS Development <linux-f2fs-devel@lists.sourceforge.net>,
 Linux Regressions <regressions@lists.linux.dev>
References: <CAAJw_Ztzyh-GNTJYpXbA0CeJv2Rz=fLZKE6_Q=7JMmM+s9yHXQ@mail.gmail.com>
 <CAAJw_Ztb0mJVkHtBhryf=9g8CA0fZZRa8HVio8GCGUSLOvqa7A@mail.gmail.com>
 <Y6bz4wOC0nwu2yGU@debian.me> <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
 <CAAJw_Zv0iBg4rkzxQ2UOOLS9JQZ4cCmM7gSoDXec_gm-GggB6A@mail.gmail.com>
 <f500d64b-c26d-ee34-092a-421c64c69f9e@leemhuis.info>
 <Y66Hk6waTeXQDz1/@sol.localdomain>
From: Chao Yu <chao@kernel.org>
Subject: Re: Fwd: f2fs write error Linux v6.2
In-Reply-To: <Y66Hk6waTeXQDz1/@sol.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeff,

On 2022/12/30 14:39, Eric Biggers wrote:
> If you could provide the mkfs and mount options you are using, and any other
> relevant details, that would be helpful.  Bisection would also be very helpful,
> as Thorsten mentioned.

Other than that, I found some cases which can cause similar issue, so I figure
out a patch for possible fixing, if you can have a try with it to check whether
it can fix your issue, that would be helpful as well.

https://lore.kernel.org/linux-f2fs-devel/20221230154332.5082-1-chao@kernel.org/T/#u

Thanks,
