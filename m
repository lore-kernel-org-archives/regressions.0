Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C87C2F2
	for <regressions@lists.linux.dev>; Fri, 27 Dec 2024 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735303261; cv=none; b=gQHbLpDuuNy2aqOv6pWzgDEwKqgqww1AVDvA739y/1nMuu3FNf3/5GebJR8EQDkdSXYXK6Jh2JbLdgaObdFdWwR2Sbx0EXKH32MBApoN8Xe+tN5YlzFy8RqeNeN+DATVZhgD6w03o/XX5jVmudIuvdRRBTTGbFcHL7Tku02KK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735303261; c=relaxed/simple;
	bh=uFn3AA49Y4Zb1MRw1jQYfQDBX1yMR+gaURua9ardGvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVvM6x93W1F7jJBWxJbk7EmfVXCBrnrjLb8sHkymsW2QaB1opWNbIWeGmodqmOCHFF/wFQM9tozXmWs7cdLDGmem8XarbP6zI8q/dr1McwBbmOu0Lu8u1+Tvkjlz+o/pp7Zhbl0ZLifU0aHBK59mJUruG/4jbPl1Sg1cvg/N4xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QyoflMlw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QyoflMlw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7254C4CED0;
	Fri, 27 Dec 2024 12:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735303261;
	bh=uFn3AA49Y4Zb1MRw1jQYfQDBX1yMR+gaURua9ardGvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QyoflMlwJfUdnyPNC4YQw+jeO01O4pRqRXTBz6BFqfkjDvddRowZ1eIFtBlrl4ct6
	 fMQ3n1WEG+CQGPp5XD6aRXBDZJ7no9VeREwaaelgGzLc0q/zC5O/GYiX5UK58VNTT0
	 hdi/xJra55ZSDMjUzRzdtGBmgGNGSxnBV/6cR2k4=
Date: Fri, 27 Dec 2024 13:40:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alvaro Kuolas <kuolas@gmail.com>
Cc: regressions@lists.linux.dev
Subject: Re: Longer boot times with kernel 6.11.7 and newer (including
 6.12.6).
Message-ID: <2024122716-previous-plethora-0ebb@gregkh>
References: <CAKUwrzBKjtxYkGoL-=mrJ9PoN_PACW0VO1Si1rUdLXfvW_h1cA@mail.gmail.com>
 <CAKUwrzDtcu2JGdVve0BF9nUR-25M3bZrSyJ6xLLiwjCehmWCxw@mail.gmail.com>
 <2024122755-status-provolone-58f2@gregkh>
 <CAKUwrzA2ue3g3Ys=Vg=eeunE1mw-RSockLPoqnU=F6jB1jjVBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKUwrzA2ue3g3Ys=Vg=eeunE1mw-RSockLPoqnU=F6jB1jjVBw@mail.gmail.com>

On Fri, Dec 27, 2024 at 09:35:31AM -0300, Alvaro Kuolas wrote:
>    "as expected" is what, faster boot?
> 
> Sorry for my wording. I mean the system boots faster and it is more
> responsive without commit cfc72b86fa20cbf44d2b6cc27b35eb15080232ab.
> 
> I noticed this problem on my system when logging in after a Fedora 41
> update. From GDM login screen to Gnome desktop running with the commit is
> roughly ~19sec and without it is ~5sec. This freeze on GDM login is why I
> started debugging.
> 
> At first I reinstalled from the latest iso F41, then tried to block upower
> update, and later I tried different kernel versions. That is when I hit
> this commit.
> 
> I have compiled 6.13-rc4 with commit
> cfc72b86fa20cbf44d2b6cc27b35eb15080232ab and without, I will start testing
> why this behaviour is on my machine and in other machines I have access to.
> I will try to look at why upower takes that much time, and why Gnome loses
> responsiveness, and check if it is only on my system (Ryzen 7900X, B650E,
> Vega10GL) or if it happens on other systems as well. I can change this
> testing to 6.12 stable if it is for the better.
> 
> Thank you for your time and comments on this subject, I really appreciate
> it.

If you look at commit 15fffc6a5624 ("driver core: Fix uevent_show() vs
driver detach race"), it shows what the original fix was attempting to
resolve, by removing a lock on the path of reading the uevent sysfs
file.

It's odd that gnome wants to read that file so much, so perhaps you
should look into what is happening there.  That file should ONLY be read
once at boot, during the "cold plug" portion of the boot process, and
not afterward as that wouldn't make much sense.  Perhaps a speed up
could be just fixing userspace to not do that anymore.

good luck!

greg k-h
