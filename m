Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D4E525E
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 06:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4ACAC433C7;
	Wed,  4 Oct 2023 06:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696400375;
	bh=CmI8BoWddO62EOPgmJUjKO2JAaho87P2B5wkjnr6E9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjItGs2brBGEUSMVlCA4ApDeGNDKiVtfnwMyjE53ZsZEFr8M+dNRnX/I9BDb+Movq
	 32BOUCvZqwoagIY7wj85crNWV7WpQOygMowOYZC+AmIZd9ULix0WkurMAdDvbOngbc
	 0oxcZ30ccBm3jFLwxGbH8jBVXWA+YgRYRbCf+jPQ=
Date: Wed, 4 Oct 2023 08:19:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeffery Miller <jefferymiller@google.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	regressions@lists.linux.dev, benjamin.tissoires@redhat.com,
	linux@leemhuis.info, Andrew Duggan <aduggan@synaptics.com>,
	Andrew Duggan <andrew@duggan.us>, loic.poulain@linaro.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: elantech - fix fast_reconnect callback in ps2 mode
Message-ID: <2023100418-clapping-driven-bc09@gregkh>
References: <20231004005729.3943515-1-jefferymiller@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004005729.3943515-1-jefferymiller@google.com>

On Tue, Oct 03, 2023 at 07:57:24PM -0500, Jeffery Miller wrote:
> Make `elantech_setup_ps2` set a compatible fast_reconnect pointer
> when its ps2 mode is used.
> 
> When an SMBus connection is attempted and fails `psmouse_smbus_init`
> sets fast_reconnect to `psmouse_smbus_reconnect`.
> `psmouse_smbus_reconnect` expects `psmouse->private` to be
> `struct psmouse_smbus_dev` but `elantech_setup_ps2` replaces
> it with its private data. This was causing an issue on resume
> since psmouse_smbus_reconnect was being called while in ps2, not SMBus
> mode.
> 
> This was uncovered by commit 92e24e0e57f7 ("Input: psmouse - add delay when
> deactivating for SMBus mode")
> 
> Closes:
> Link:https://lore.kernel.org/all/ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info/
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> 
> Signed-off-by: Jeffery Miller <jefferymiller@google.com>
> ---
> 
> The other callbacks set in psmouse_smbus_init are already replaced.
> Should fast_reconnect be set to `elantech_reconnect` instead?

What commit id does this fix?  Should it also have a cc: stable tag?

thanks,

greg k-h
