Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06571A5A8
	for <regressions@lists.linux.dev>; Mon,  2 Oct 2023 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xn7mU0O8AywxfzFuGVmvml/wEV+n9HbyxBG52KH4Jls=; b=OK5OobfEO9IkO7vYm+2tBaPoOQ
	I3+u7tkrIuhJWRf+G8nxoJ5B7rAN4dKUKvYQVJJAEIyMYOvRJ/VDsOepxi2ABVPnTQTJ+ZW943QGT
	ArjBQExuTUJAaEuGIyz1s6DZOcLy4oiEwWa18YXy7W5F13d/y/4jF78IbBrpbbvg0LUHxuxV4w7fF
	VtGCf1eQ1ilduhoKehjj/YtBJhcUJe5PG+mQ/nx9VINhzJ22B50vJ5Dtuitd9TTquUV5x0i8AlZ1f
	wxqRgsbtAzZvuaBJjnY8r5zVF/yYW47Re9Ody/bBDl5qwYEfcQ4Dj2uJkLWfgXdWgyLAUfeNMHzSQ
	buUqbQ9w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qnJyX-009YFL-Pv; Mon, 02 Oct 2023 14:32:45 +0000
Date: Mon, 2 Oct 2023 15:32:45 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Linux Regressions <regressions@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Message-ID: <ZRrUjcWqtmzPV3Fs@casper.infradead.org>
References: <13360591.uLZWGnKmhe@natalenko.name>
 <2701570.mvXUDI8C0e@natalenko.name>
 <ZRqeoiZ2ayrAR6AV@debian.me>
 <2300189.ElGaqSPkdT@natalenko.name>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2300189.ElGaqSPkdT@natalenko.name>

On Mon, Oct 02, 2023 at 01:02:52PM +0200, Oleksandr Natalenko wrote:
> > > > > BUG: KFENCE: memory corruption in drm_gem_put_pages+0x186/0x250
> > > > > 
> > > > > Corrupted memory at 0x00000000e173a294 [ ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ] (in kfence-#108):
> > > > >  drm_gem_put_pages+0x186/0x250
> > > > >  drm_gem_shmem_put_pages_locked+0x43/0xc0
> > > > >  drm_gem_shmem_object_vunmap+0x83/0xe0
> > > > >  drm_gem_vunmap_unlocked+0x46/0xb0
> > > > >  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
> > > > >  drm_fb_helper_damage_work+0x96/0x170
> 
> Matthew, before I start dancing around, do you think ^^ could have the same cause as 0b62af28f249b9c4036a05acfb053058dc02e2e2 which got fixed by 863a8eb3f27098b42772f668e3977ff4cae10b04?

Yes, entirely plausible.  I think you have two useful points to look at
before delving into a full bisect -- 863a8e and the parent of 0b62af.
If either of them work, I think you have no more work to do.


