Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F52A2F24
	for <regressions@lists.linux.dev>; Sun,  6 Feb 2022 17:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1692BC340E9;
	Sun,  6 Feb 2022 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644166825;
	bh=LSeI1k6uUu2ddPXYtJQSrQI5xWnGbR105VfsXTYPRGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yGqRM5UgoXPFBYIdG0wtk9ef2Lh38JKizrTDye0W4OmU/A1u9ynrvIORR27OV2brm
	 KXC1qjWXcEXUKXJXzFkn8QklBh7G6QbQdb7FsvDfESJb5GdApZRWY8nNWHkrHUZK69
	 o1/a1IWBlMnkfP3X0Yx4rg5uewHu5rZR5/HRpNdI=
Date: Sun, 6 Feb 2022 18:00:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: MP <fromschoollaptop@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	tech.support@broadcom.com
Subject: Re: Asus Router Kernel Panics
Message-ID: <Yf/+npr9xV2HVg9k@kroah.com>
References: <4f5dccba-ab28-8007-bed8-f2594498c8c1@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f5dccba-ab28-8007-bed8-f2594498c8c1@gmail.com>

On Sun, Feb 06, 2022 at 09:57:15AM -0500, MP wrote:
> 
> Hello all,
> 
>  Just looking for a bit of guidance here and a suggestion on proper next
> steps. I think there may be an issue within the below broadcom nand driver
> implementation.
> 
> I have an Asus GTE-AX11000 and it reboots\crashes multiple times a week,
> upon inspection of snmp logging you can see the below entries, when the
> kernel panic occurs the entire router locks up, and sometimes reboots.
> Sometimes it doesn't reboot and the router hangs completely and drops all
> network devices, and removes wireless SSIDs and all of your devices lose
> their connection.
> 
> Not sure who to turn to but Asus support has not grasped the gravity of this
> problem and I am thinking this can only really be resolved with a
> firmware\driver\linux update, so just hoping for some additional help or
> guidance from this group.

This is a very old, obsolete, and known buggy kernel version running any
number of unknown closed source kernel modules.  Only the manufacturer
can help you here, there is nothing the community can do at all, sorry.

Best of luck!

greg k-h
