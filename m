Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6A43C47C
	for <regressions@lists.linux.dev>; Tue,  5 Dec 2023 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMkY/aU4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E7EC433C7;
	Tue,  5 Dec 2023 08:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701765428;
	bh=Gx0Gid6CgNqEt1nJzs1qtZqNtgefBQINfqVpJBkwASY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMkY/aU4jWPbPqybwAqA+E6Cw/6E//QdRtkIJuI1KiaUk5E3XBpZYxYrOOzDvSAms
	 mVzVRQYxa7YJIq3bgct69MgP9NvG81FiYy+m3pUvGv0VXOqJ9SMMPh/b6cPDO8cGI5
	 b89f2mod3hvF60FqdRKO8iCMKV5B3jmNxAaTP8Lv4STdORnf0C6/VSz6+vEpZtaHgO
	 pzSV1M/kcR0ReeKX9p6s+i0UYtgsmIm0xPUKRmHhBppiQphOxvpcbsfyk9wodlH4RW
	 4Kkc/a7CXQsSZ8vFVUPGTf4vXMpDN7IULVmEfdLRBMjaQsuJe+2VBvpc1dGLfUcShL
	 k8jcDiJ2UPMSg==
Date: Tue, 5 Dec 2023 09:37:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	davidgow@google.com, dan.carpenter@linaro.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: Kunit drm_test_check_plane_state: EXPECTATION FAILED at
 drivers/gpu/drm/tests/drm_plane_helper_test.c:123
Message-ID: <rxv7jlfuwjib443pzdepbtgu454gdzemd3ojmmhbnhr4syneve@6me3bduyx2ee>
References: <20231204173536.51003-1-naresh.kamboju@linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="avjzm6fep5gbbakc"
Content-Disposition: inline
In-Reply-To: <20231204173536.51003-1-naresh.kamboju@linaro.org>


--avjzm6fep5gbbakc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

Thanks for the report

On Mon, Dec 04, 2023 at 11:05:36PM +0530, Naresh Kamboju wrote:
> The Kunit drm_plane_helper failed on all devices running Linux next-20231=
204
>=20
> ## Test Regressions (compared to next-20231201)
> * qemu-armv7, kunit and
> * x86, kunit
>   - drm_test_check_invalid_plane_state_downscaling_invalid
>   - drm_test_check_invalid_plane_state_drm_plane_helper
>   - drm_test_check_invalid_plane_state_drm_test_check_invalid_plane_state
>   - drm_test_check_invalid_plane_state_positioning_invalid
>   - drm_test_check_invalid_plane_state_upscaling_invalid
>   - drm_test_check_plane_state_clipping_rotate_reflect
>   - drm_test_check_plane_state_clipping_simple
>   - drm_test_check_plane_state_downscaling
>   - drm_test_check_plane_state_drm_test_check_plane_state
>   - drm_test_check_plane_state_positioning_simple
>   - drm_test_check_plane_state_rounding1
>   - drm_test_check_plane_state_rounding2
>   - drm_test_check_plane_state_rounding3
>   - drm_test_check_plane_state_rounding4
>   - drm_test_check_plane_state_upscaling

I found the source of failure to be f1e75da5364e ("drm/atomic: Loosen FB
atomic checks").

Fortunately for us, it's already been reverted yesterday for some
unrelated reason, so it should be fixed in next-20231205 onward.

Maxime

--avjzm6fep5gbbakc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW7hKAAKCRDj7w1vZxhR
xdLHAQCBq1TbsVGexMuiakZrs0ljSHEFqv6BDxICWNEamhhfPwEAnZl6aajng8Dm
yG/mkv/gJ4qnjDD0+M21kXMNe6WCkQc=
=ckFT
-----END PGP SIGNATURE-----

--avjzm6fep5gbbakc--
