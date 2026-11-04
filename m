Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792941;
	b=Qtbjeyn70mii7WPTu73+gNa0u+yPwMcY5cw7QoP2biCPZ3jOkCXFh9bzb0As1wJsU9sB
	 cRr0Ek/f4xxhfJfRSOW16rk4fnIY2vZ6DTz6CRXV4t5iumOBzaOotupbYriHdPMV4xBFS
	 cjPynXqjDaMTNBHQmueKc7UKZszNKauC5SkO+MrYNaDIxtkjUNeJwdQ2DCR3DBAI4upyU
	 R5yLRtYDHu7UBe5QSFYL3rgxDmUGAALzR5W7Odvf7tSOZoSCLmKalT6G6u8Io0y1VIlZ4
	 oOsdj+00L8RmuDSLS6OvDA4nzLCQlt2StC0NMfZJOGor6wPFjRUMKXpFHMFXSa+Bpog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792941;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=COuggtR3/6hXgRSWHvUvL0nAwNilMsudL7OYm2wb3uA=;
	b=fKs5FRnEZP/432/FmbUNm23j1YSoznxwoPEa3/mYqJZxbA7OjciInW3MpzEo4eU4KDVi
	 fjIPtqqGZdRTdSEAPKDrLIIeEabI3s3mYtZAQVC8YTKyJcA4vjoq05sssYufn5uVipC11
	 4y+aWfNXM/hZSKmU+eNiboapB1LqsKTA8tcDPa6D4lqHsB1wED2/7E6JseEH5twDHy4bw
	 ZcEHg94OIlTmadvPLwTkSXvMRLGgci4qQnTz4YiONjiDVOWz0StaWMJc6OCLHiz3Z2jyv
	 HON+yXggcV77w68nH93WNTJdkkWpWP21vxjSgPTl2bdbnm6AIiFTTsJn+34dz1qqwig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jh6bYscY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F28606A31B;
	Wed,  4 Nov 2026 11:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jh6bYscY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478051F00919;
	Wed,  4 Nov 2026 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793792940;
	bh=COuggtR3/6hXgRSWHvUvL0nAwNilMsudL7OYm2wb3uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jh6bYscYFdaQKfEqGI4vtk+J3HQZUIqmLNS85G+vlG2UsOuqHqd0KaNO0PYGCc/Bp
	 7enJXBpQWC/8U9BQasVldPXb8We8MR0JydzKUgfYFXE4c1CleEVtT1fy9PaWliLEpt
	 AWnN3Ei2cUli8swbba/n3Xffav9piqkQZSAFiRnIzqhGc68HW37U6zvtZ82WgGFHt9
	 nsrk8Dk4m1NpcqljHWiq10WgE9HN+1Mnxi3aaBEnWt+72QEZhkHqcFXBgmvcFjckJi
	 fIe7eZ9bGhBegO7CgR/rwHMxdNnBHE7wnzP0eT6gqt8hufbhWpusksFRuO/QcEHLan
	 l8qX5fcZZsTsA==
Date: Wed, 4 Nov 2026 11:48:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
Message-ID: <5ed2348f-83db-468e-981b-2bc62fc2bac5@sirena.org.uk>
References: <aujZcJBUyQ7iX_PM@intel.com>
 <e14e582e-d9d1-4c95-a23e-cf1e6f2feabd@leemhuis.info>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KUqRJAUzGYuVbdLS"
Content-Disposition: inline
In-Reply-To: <e14e582e-d9d1-4c95-a23e-cf1e6f2feabd@leemhuis.info>
X-Cookie: All rights reserved.


--KUqRJAUzGYuVbdLS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 04, 2026 at 06:49:29AM +0100, Thorsten Leemhuis wrote:
> On 11/2/26 19:41, Rodrigo Vivi wrote:

> >   drm/drm-next, drm/drm-fixes
> >   drm-misc/for-linux-next, drm-misc/for-linux-next-fixes
> >   drm-intel/for-linux-next, drm-intel/for-linux-next-fixes
> >   drm-xe/drm-xe-next
> >   drm-rust/for-linux-next, drm-rust/for-linux-next-fixes
> >   amdgpu (agd5f/linux.git#drm-next)

> > drm-exynos, drm-msm, drm-msm-fixes, drm-msm-lumag, drm-nova and etnaviv
> > are not part of it and stay as they are.

> > The main reason is to reduce the conflict pain that Mark constantly faces.
> > All of them should be handled already when we are rebuilding drm-tip.> [...]

> Please correct me if I'm wrong: this seems to mix up patches for the
> current cycle (e.g., -fixes branches) with those for the next one -- so
> I assume the former won't end up in next/pending-fixes anymore?

I'm hoping is that the theory is that they will work like a lot of other
trees and merge all the fixes branches first, push that out as something
I can pick up, then merge the other branches on top of that.  That works
well elsewhere, I'd expect it to also work well for DRM.  One of the
goals from my point of view is that the mess caused by all the cherry
picking is resolved by DRM and isn't visible to -next.

--KUqRJAUzGYuVbdLS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrrG6UACgkQJNaLcl1U
h9BieAf/bQ8OVo6pNYJbXv1ww6DbkYA1dhBBojhY2XSltMdi6CY+6igpIXQ1xs8q
rlkJfzwQn371HAh3uUJBgW0Kj+mpOBDMyIUtxQoMHfUEWwt8EUFwDSwNIZ0CRqq5
6tREnTudUG5xlDJ3fZwSq2aeecH5apxdcenmOeGIvOO2H0VjfR+lWXoXiyzwv+Zl
QfaG3Jnp8jx2oYwu4tFVmgGx2DKq4CRJiQmhZl/B6ZLoKC712hjUdCnqckxe/b10
Vgq8N+VA2XYZHmf78ty77MGGh8fJWbE++SmC5x/QLEeQy9gw0cdR105mql7HkpBi
qApVQv6LrttSypeumKSfhcwSExCYYg==
=VIlo
-----END PGP SIGNATURE-----

--KUqRJAUzGYuVbdLS--
