Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45E33CF
	for <regressions@lists.linux.dev>; Thu,  6 Oct 2022 19:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DD3C433D6;
	Thu,  6 Oct 2022 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665084524;
	bh=sRSk/H4zHpiuPMci286gZ86F9BQptTnmXwVSsHyJy7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uklQVp6T7OunVZ9cRlSqPHBx1K5FHD+0Ka859t/bAJllpIUF/vQ5/uNZQ2KQjhHJF
	 SNLcqvZY5bCZIFrvJ8O4Hzwsn3/L9SUTKsZ4FbI7p2G630OT/114+5kADMqaxzANYZ
	 9MbckqWr0gh+vhv6WvaR4yExH0HgfjCtoEo2KKFQ=
Date: Thu, 6 Oct 2022 21:29:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <Yz8slRMm3QBE0LNL@kroah.com>
References: <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com>
 <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
 <YzqjfU66alRlGk5y@kernel.org>
 <251201be-9552-3a51-749c-3daf4d181250@gmx.com>
 <20221003142240.hu5gj7fms5wdoujk@meerkat.local>
 <6363db78-f676-427d-b479-7065091f3f59@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6363db78-f676-427d-b479-7065091f3f59@gmx.com>

On Thu, Oct 06, 2022 at 10:46:29AM +0000, Artem S. Tashkinov wrote:
> Lastly I've had a crazy idea for a second of maybe migrating the kernel
> bugzilla over to RedHat/IBM (by asking them whether they are willing to
> help) but on a second thought it's really really bad as the company is
> very large and there's a ton of bureaucracy, so managing it would become
> quite a hassle. Also, I wouldn't want the LF to hand control over it to
> RedHat.

bugzilla.kernel.org was originally created by IBM way back in the 2.5
kernel days (by people at IBM at the time), and then the passed it off
to the kernel.org admins.  I doubt they want it back :)

