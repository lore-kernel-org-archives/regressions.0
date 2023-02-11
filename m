Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C429AB
	for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 13:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFEBC433D2;
	Sat, 11 Feb 2023 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676120739;
	bh=n5Ozbl7or5SWI2es/CuKzgz4iu3RjGOvAnskch5o0pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDUoqpf4zvgM0iqyH67Dy86VEs9MRbrKW7pyQyqmOkT2ClWno5IIO0WbINsMqzAG5
	 PbklYKG7ffDrWxw5M5Lxs8AxFAxYf976d+ciEp/fHMqHXQwIDlBiUNtz7R6mZhCi1X
	 kttL52vOPkTE1jv/Dv2oF3nW1KcGAljpJe47jde8=
Date: Sat, 11 Feb 2023 14:05:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sasha Levin <sashal@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: Heads-up: one change merged for -rc8 that might be good to have
 in the next 6.1.y release
Message-ID: <Y+eSoNuIUDAU1x/J@kroah.com>
References: <git-mailbomb-linux-master-690eb7dec72ae52d1d710d14a451844b4d0f4f19@kernel.org>
 <b74b2c93-bd0b-84c2-868b-d5376a16b020@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b74b2c93-bd0b-84c2-868b-d5376a16b020@leemhuis.info>

On Sat, Feb 11, 2023 at 01:42:25PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi Greg. Would be great if you could pick up 690eb7dec72a ("HID:
> logitech: Disable hi-res scrolling on USB") for the next 6.1.y release,
> as it's fixing a regression I saw multiple people report.
> 
> The commit (see below) that was recently merged to mainline and has a
> proper stable "Cc: <stable@...>" tag, so I guess you scripts will at
> some point pick it up automatically. But I noticed you updated the
> stable queue and hour ago and this patch afaics is not in it yet
> (despite some other patches being in it that were merged later), so I
> thought: just to be sure send a quick heads up.

Thanks, this is still part of my "patches applied in this -rc cycle"
queue.  I'll go apply it now, thanks.

greg k-h
