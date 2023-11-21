Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2D630D1E
	for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 13:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="XggO7yx+";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="XggO7yx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1700571923;
	bh=K+dMD9pzG7pfSfwhqVDQhTYAlTAD4kHlw3iJP29adek=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=XggO7yx+ZnJs1lPcj0xCaMrwi7mHSsFNC6kUtJ6wH24BAR61oENBlQ96BGsEdJ3DM
	 lmcaA5JFidL9bwohV4UkL8w5fyyhzZVzk1drErszQJNUKVXehu1M/nUfDMNip1zlrv
	 GQbI4jeQdPZDqqwRlxSH5yg+C4/EFWuXFECrAtWo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id BE7691286B94;
	Tue, 21 Nov 2023 08:05:23 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id U7UB_cKOoiwM; Tue, 21 Nov 2023 08:05:23 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1700571923;
	bh=K+dMD9pzG7pfSfwhqVDQhTYAlTAD4kHlw3iJP29adek=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=XggO7yx+ZnJs1lPcj0xCaMrwi7mHSsFNC6kUtJ6wH24BAR61oENBlQ96BGsEdJ3DM
	 lmcaA5JFidL9bwohV4UkL8w5fyyhzZVzk1drErszQJNUKVXehu1M/nUfDMNip1zlrv
	 GQbI4jeQdPZDqqwRlxSH5yg+C4/EFWuXFECrAtWo=
Received: from [IPv6:2601:5c4:4302:c21::a774] (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6B3921286B89;
	Tue, 21 Nov 2023 08:05:22 -0500 (EST)
Message-ID: <18b3745d3e5de2ffd9b74f9cc826c2c3235dc6ca.camel@HansenPartnership.com>
Subject: Re: scsi regression that after months is still not addressed and
 now bothering 6.1.y users, too
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>, John Garry
 <john.g.garry@oracle.com>, Greg KH <gregkh@linuxfoundation.org>, Sagar
 Biradar <sagar.biradar@microchip.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>,  Adaptec OEM Raid Solutions
 <aacraid@microsemi.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Sasha Levin
 <sashal@kernel.org>, Hannes Reinecke <hare@suse.de>, scsi
 <linux-scsi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Gilbert
 Wu <gilbert.wu@microchip.com>
Date: Tue, 21 Nov 2023 08:05:20 -0500
In-Reply-To: <a3ddbd03-7a94-4b6a-9be1-b268ce883551@leemhuis.info>
References: <c6ff53dc-a001-48ee-8559-b69be8e4db81@leemhuis.info>
	 <47e8fd80-3f87-4b87-a875-035e69961392@oracle.com>
	 <a3ddbd03-7a94-4b6a-9be1-b268ce883551@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2023-11-21 at 13:24 +0100, Linux regression tracking (Thorsten
Leemhuis) wrote:
> On 21.11.23 12:30, John Garry wrote:
[...]
> > Is there a full kernel log for this hanging system?
> > 
> > I can only see snippets in the ticket.
> > 
> > And what does /sys/class/scsi_host/host*/nr_hw_queues show?
> 
> Sorry, I'm just the man-in-the-middle: you need to ask in the ticket,
> as  the privacy policy for bugzilla.kernel.org does not allow to CC
> the reporters from the ticket here without their consent.

How did you arrive at that conclusion?  Tickets for linux-scsi are
vectored to the list:

https://lore.kernel.org/linux-scsi/bug-217599-11613@https.bugzilla.kernel.org%2F/

So all the email addresses in the bugzilla are already archived on our
list.

James

