Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A301474D3
	for <regressions@lists.linux.dev>; Thu, 11 Jul 2024 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720682852; cv=none; b=pFe8P5Iot9zu+CntpRYP+DaVUc4AQOztT0gwCYYGVBxLmQHDiRwt8B9hGe1EseEDDDnLJXmskr6Wlo0KOFoiWXSkAcbkRn6lzQAKfPOEHH7Xmkmb6tYIaEFMzcXUHs8iMZsLIG2EYWAI+zDdAPZ0Nf2z82FLxk88KetWI2xEJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720682852; c=relaxed/simple;
	bh=tnMVy03FpVUs0avKDKBIlgBSJgjAemEad8byh8DX4fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpS4H9XKU4c+kpC9KJkw46tJoS7XHVWOarQBo16OnbNOVnF3hzsvfyf6GoelunXrsxeSbrcGxmsGWR1JCzPH6QkfJG9AMAK3f75k2++aN3XGl8UQqTOMiyZmI+SEk9UE/iWBGyR/JX6x/z52MzwI1r4A5OGY/LXI9511QKS9LlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yGprUZ42; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yGprUZ42"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B09C116B1;
	Thu, 11 Jul 2024 07:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720682851;
	bh=tnMVy03FpVUs0avKDKBIlgBSJgjAemEad8byh8DX4fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yGprUZ42ypZFr6Mf5z2PhI9N/SBGqCJDIGdoBeoQ1+p2dZrNm0wCQmjHhh+HmNwTe
	 3GFuA0sYB9RLsfZm/oM9Ywg6k3163QukWOGrLoxmO7LXzv2FiMAd4NgQnJF+YWVJvI
	 dbHjeQFuJTcWs9tA6uVlxldABa/JUG1l45pqItXM=
Date: Thu, 11 Jul 2024 09:27:28 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Steinbei=DFer=2C?= Sebastian <Sebastian.Steinbeisser@lrz.de>
Cc: "pc@manguebit.com" <pc@manguebit.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Message-ID: <2024071139-plunging-juncture-a633@gregkh>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>

On Thu, Jul 11, 2024 at 06:20:08AM +0000, Steinbeißer, Sebastian wrote:
> Dear Greg,
> Dear Paulo,
> 
> Have you been able to take a look at the logs I sent?
> Is there any additional information I can provide?

Sorry, that's up to the filesystem developers, I don't know much about
this at all.

greg k-h
