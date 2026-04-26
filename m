Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C432E11D2;
	Mon, 27 Apr 2026 03:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261910; cv=none; b=WrxyDn492FLJDnfg+KaxB6wpvIK9QiEDyV1j0vmXCj84oULHrH1XKPqhTHgit4R0TuE5UU6jcVAFCtHQJw4pMplIUVJEWrgqcbD+9RUOBqTQW0zH43RY/5SJ9us+bp+LXyMaMULYWZX3yoJ+HEYaNPjW++GBIIKuLkRdfKdZ9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261910; c=relaxed/simple;
	bh=Pg6XUODrdfT8x6SVOm/92QEhs4B1/dQMLI4JVCWBeX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4pShH1ZwyNnBI8Zz7fCeYwtPMUJpgSrdcjU1lxla1yXAIf7iSzH5wAoWJ4hVOxh00/sCRWE6OnfIe3A448uFf3QOpnxKzCAeMTwE1Ibyqnryb2K3X50t5427yADKbHqQdYgYlRlardsv0gRMsXYBMdnoD+EteJSF2jZ58MZ3/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ESNQGdoj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ESNQGdoj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5570DC19425;
	Mon, 27 Apr 2026 03:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261910;
	bh=Pg6XUODrdfT8x6SVOm/92QEhs4B1/dQMLI4JVCWBeX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESNQGdoj+aWIprEyqTgGSLUpXlQdmIPlutuefFcrRqV0H15RmrX8HsTp05zE6vxEE
	 zaQmVUeuymea4PYf/ZdCPVl7fmaL7NZKNE5k9m+2lS9aCFSVp0JkO8PQDwLQWMlbvX
	 2/sZh3+iglfusL8lsOv/UkXWuPbsbOZ6jIUzZBCc=
Date: Sun, 26 Apr 2026 23:16:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: the stuttering regression in 7.0: should I have done something
 different?
Message-ID: <2026042656-exposure-crayon-a7c5@gregkh>
References: <4dd98a32-d1d6-43de-910c-7e487503177e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dd98a32-d1d6-43de-910c-7e487503177e@leemhuis.info>

On Thu, Apr 23, 2026 at 06:30:24PM +0200, Thorsten Leemhuis wrote:
> Linus, Greg, if you have a minute, please help me out with something I'm
> wondering about:
> 
> Should I have done something different wrt. to the periodic lockup aka
> stuttering regression? The one quite a few users encountered, bisected,
> and reported last week following the 7.0 release before it was fixed in
> mainline & 7.0.1 during the first half of this week; see below for a
> timeline of the whole thing.
> 
> I'm not asking if this could have been prevented or if the developers
> did anything wrong handling this. I ask because I want to do the right
> thing if similar situations arise in the future to ensure they are
> handled like you folks want them to.

I think this went fine.  It was caught properly, and fixed, and pushed
out to users pretty quickly.  We can't really ask for more :)

thanks,

greg k-h
