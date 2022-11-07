Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7C22563
	for <regressions@lists.linux.dev>; Mon,  7 Nov 2022 07:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7DCC433D6;
	Mon,  7 Nov 2022 07:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667805272;
	bh=/CKlzvi4Fxp/kQHs/EzlDa5U3bpFmjPwIVjOUnageUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2jNNGXhgyaVaQh5HcXIBj2Pt5OAIH8OIYV8JQXFsoth5EmWtak3mAE+LEpf7a8Lk
	 ANt8mno2VmpOxeufdRG82kJx6K/cWJyZ7a3Pt0/2Wc0053UB668Vt/Rcc4kcu8kxL/
	 c7bb55h1QkWoRuaHuFSH9VrFDIA0WsBCOCRS9Qj8=
Date: Mon, 7 Nov 2022 08:14:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: malaizhichun <malaizhichun@tom.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: This is about the acip-bios problem
Message-ID: <Y2iwVT44/T1cofZG@kroah.com>
References: <39ebab39-fb03-4be4-ec00-c5665f19fbdd@tom.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39ebab39-fb03-4be4-ec00-c5665f19fbdd@tom.com>

On Mon, Nov 07, 2022 at 09:25:51AM +0800, malaizhichun wrote:
> Please what time  the acpi-bios error reported by the dmesg command will be
> fixed, it's really annoying. I have never been able to eliminate such
> reports, it's only to insert loglevel=3 in grub settings to block. But it
> doesn't solve the problem, and  I use google search , it's tells me that fix
> this problem need a bios upgrade, but actually my hardware has  stopped
> upgrade, so I don't know how to do fix this, thanks

Please discuss this on the acpi mailing list, the developers there will
be able to help you out.

good luck!

greg k-h
