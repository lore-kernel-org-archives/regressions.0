Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442F723BCEE
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 05:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783747922; cv=none; b=XvBzD50wZDBbkWwWFIImVOKW1tBBG8l4I4T9cPoL+LazCbFP8KZiSxbq7bCAnyPIRFSq6DmOy9O1toP0jGrxkn8n22ilkWK5LDmT5K+p4QZEzQYtNOoGTQ2zi2NiMW82Kk5uBt2rYdTKdJe4ViKBlKRWS+ofVo9Bp1c8RquGeMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783747922; c=relaxed/simple;
	bh=8nZuVfQgjPXtTwXHtHMz3so6FcOoi3iLjpCxYfJT7iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoY3WyvgnD+obDc1GxsuP2owIo6DXcR4gdrfbiCJcto75Vd/oiJ9kYyYimSpAwx6sHXz0Z8YCwwBURTYMy/y8haCe1QWKzZxSXrrcYu46axIC1SWdTPsn7UNpFSCX98nYlZXDaecV/p40kP0qvjeaKjpx5Ku4Lx3coX0kghG67A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vFbT8Phi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vFbT8Phi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803AD1F000E9;
	Sat, 11 Jul 2026 05:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783747920;
	bh=Spsdb938LnV1UITEqY/XOEkuUS2npiCyYXgDuULo+iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vFbT8PhiRzmDNVUMW2Psa9MVYgO1EuSSFm6cWlCwtigTODSJJanD4xfnTMm5+84aj
	 ADoBPpmNmERhx7kpCw/hawrvyBGdRAFwL9eK3UPjMUCibaR4YCDfNa1+qFWbxiaFc4
	 D6adRSPxcVbuea4PNWtOlPgQp8WH/xHZPD4vp3uM=
Date: Sat, 11 Jul 2026 07:31:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Papool Chaudhari <Papool@chaudharilaw.com>
Cc: regressions@lists.linux.dev
Subject: Re: [REGRESSION] 2017 =?utf-8?Q?Pixelbook_?=
 =?utf-8?Q?backlight_control_doesn=E2=80=99t?= work with 7.1 kernel
Message-ID: <2026071109-armchair-civil-7b62@gregkh>
References: <CALcz8n5nB=H8CZza-Pw==GfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com>
 <2026070936-geologist-yapping-31f4@gregkh>
 <CALcz8n6VtL5D20WCJEsiBRDRKOE6GsF+YPCc+XuS2xr-mqnSTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALcz8n6VtL5D20WCJEsiBRDRKOE6GsF+YPCc+XuS2xr-mqnSTg@mail.gmail.com>

On Fri, Jul 10, 2026 at 11:09:34PM -0600, Papool Chaudhari wrote:
> Greg,
> 
> I did git bisect and this is the offending commit:
> 
> b3793af3277f65d256d67f9949e760b434ff66dd is the first 'bad' commit
> commit b3793af3277f65d256d67f9949e760b434ff66dd
> Merge: 51cc1c427461 88919bedabb8
> Author: Jiri Kosina <jikos@kernel.org>
> Date: Thu Apr 16 21:08:14 2026 +0200
> 
>    Merge branch 'for-7.1/intel-thc' into for-linus
> 
>    - power management improvements to intel-thc-hid driver (Even Xu)
> 
> drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 16
> ++++++++++------
> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 47
> +++++++++++++++++++++++++++++++++++++++++++++++
> drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h | 4 ++++
> 3 files changed, 61 insertions(+), 6 deletions(-)

Odd that a merge commit is the issue.  ANd if you revert that change,
all is good?

thanks,

greg k-h
