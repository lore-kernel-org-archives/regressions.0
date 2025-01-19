Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C828C19D070;
	Sun, 19 Jan 2025 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297084; cv=none; b=Xjr3APfITJT/yckJKg7P+cjJ2Ki+cnknLXac9PrbsYtemsBjj89Iwpg1n8D3ZbMajaMqIJskvXqT/1bsKCbGiIci75KO3MA7oxXIhmMQdvQFjqL3ANOqV6v/T8h2JN++Wf1pmpJJe4gZEnhGd3pEECRZKaeI+Ltto4I/dOnurXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297084; c=relaxed/simple;
	bh=r1YFxUbq4r3uRKRRCHZThvCxOokV3FnJSIJOIUsQ5so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfJPstHeUK50g0Te5ZqEbbm+tOPHVQwMZEAbYTSdJ+Pxq5dLIm1SY7ityCtRhPtBZuuPJUiGqPF3/FBoorLcSc8XaCuEj/KnyseFTkbGXpzxfs6VpesMm/zSiJENmAz7OHkNk52Kd9OoHEZSt8GqmcP5eLoQaphTXV0hKkhkajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TAX5x8wz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TAX5x8wz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1454FC4CED6;
	Sun, 19 Jan 2025 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737297083;
	bh=r1YFxUbq4r3uRKRRCHZThvCxOokV3FnJSIJOIUsQ5so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAX5x8wzkejEYBC76XQK0QWy2Y+QOp1Q2l7nB8p411BX5EzQLM0s5PBJgI+9HnNkY
	 OxAX00ABI0ARrP01Han3Y8aez2szD1g/CIhbh/jKuBaybdjJO9B/Sysu8dBi2/obxw
	 NXCbRlP6psvKeoSmBM6XBmqq29WopV/Okbfovcxk=
Date: Sun, 19 Jan 2025 15:31:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ffhgfv <744439878@qq.com>
Cc: stable <stable@vger.kernel.org>,
	regressions <regressions@lists.linux.dev>
Subject: Re: Kernel bug found in linux6.9-rc7
Message-ID: <2025011937-breeching-cornfield-767c@gregkh>
References: <tencent_A3FB116603B2596D123C55CCC8DC2E6E1F07@qq.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_A3FB116603B2596D123C55CCC8DC2E6E1F07@qq.com>

On Sun, Jan 19, 2025 at 09:49:08PM +0800, ffhgfv wrote:
> Hello, I found a bug titled “&nbsp;kernel BUG in ocfs2_refcount_cal_cow_clusters” with modified syzkaller in the Linux6.9-rc7 relegated to oracle cluster file system.
> If you fix this issue, please add the following tag to the commit:
> Reported-by:jianzhou zhao <xnxc22xnxc22@qq.com&gt; , xingwei lee <&nbsp;xrivendell7@gmail.com&gt;

Please report this to the proper developers and mailing list as found by
the scripts/get_maintainer.pl tool.

Also, as you have a reproducer, please try submitting a real fix for
this so that you can get credit for the fix as well.

thanks,

greg k-h
