Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9262F33
	for <regressions@lists.linux.dev>; Wed, 26 Apr 2023 13:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04792C433EF;
	Wed, 26 Apr 2023 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682517582;
	bh=vZYOd9ZMoYmwf3b+spb+OoUtq8EhF1VgLjGvisoKmCQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a/pNTmBrpkctU2watCmwLjtb9DTn4oxxQ3qxLdRM05LSK/NPv3+y1N36Q9/aqfZ7Q
	 G847Lc20im7jcw0hR0mX+peDIwADEZs8GfJzCNamltqolMZ6UR+fc9yWwb89AQ+3+m
	 ThxA535qRJEuy3WzVc5upOSec8SSKU0H5LU7n0sfC3TiYqw0TseWMXPGT0Pk2NU0sb
	 oBWpi52MEHKDmuMOdchJVfjipJFOPCl68PvI+OEHQFcFRb41yPs5fRnxd5Vb4hCpNn
	 +iJKCALqhIRs3YIWJ2DFWEwQt8i2i2tIkNY5zFJG0a2FlmklkgDAir3LOQ/Rz1Q+sN
	 dXJLJJVsIN69w==
Date: Wed, 26 Apr 2023 06:59:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, regressions@lists.linux.dev
Subject: Re: USB sound card freezes USB after resume from suspend
Message-ID: <20230426065941.7615ffc6@kernel.org>
In-Reply-To: <a2e18eaa-2984-c2ba-f101-e16ad1dae0a0@perex.cz>
References: <20230425111924.05cf8b13@kernel.org>
	<87pm7rtdul.wl-tiwai@suse.de>
	<7645c6c8-a21c-23d7-5c19-cd2892b98481@perex.cz>
	<87leifjc16.wl-tiwai@suse.de>
	<a2e18eaa-2984-c2ba-f101-e16ad1dae0a0@perex.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Apr 2023 13:04:15 +0200 Jaroslav Kysela wrote:
> > A good point, it'll be a patch like below.  
> 
> It looks good.
> 
> Reviewed-by: Jaroslav Kysela <perex@perex.cz>
> 
> > But we still need to figure out what's actually happening there.
> >     
> >> But I cannot reproduce this lock here.  
> > 
> > Here too.  Could be tied with the config or the device?  
> 
> Perhaps. Jakub, could you do more debugging (printk, traces)?

Let me get back to you on Saturday - I'll test the patch and try a bit
of bisecting. Can't promise much in terms of printing, because IDK what
to print :(
