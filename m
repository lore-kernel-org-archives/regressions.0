Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE0BE6F
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 10:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAC2C433C7;
	Mon, 11 Sep 2023 10:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694428962;
	bh=uWJY/w9fi0ck8832Ox7eif8IXgu2yYhH8rrmB2yxmvA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=GaoJtjdRaiKbyK6BJ1KHNENgj4HjJLwDRzJQsF3rXDOUqB1WYyeJr0k4aKfiRGo9H
	 yFeoqB793oiRQ8Zvoq64r1hRJySOkl7ukYEs9skFQmPTDQKYcM2FEPD0Co5Soiix9a
	 cuJEpWlIddBAsdOHMiKw9EnPUXTL0qCvQ4hqhMPkbGrhSd9FnTMjaAt9Uqzbcm3bJQ
	 LHpI4mufHn2GoNE7LykXvO6N6fwijzPBkAFIid8bW+Tif8ErWBXMEngtBJkQWPdcaO
	 F4KjMi+ftTpDqX1EmSaEUVv0eK+OtIJ/+od/vb7wL8I/bfs1paS7imbdPwnyvPDd6r
	 dUtsmewgVG5kQ==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Sep 2023 13:42:37 +0300
Message-Id: <CVG0XP0M7KNM.2NA8DSD0TGK4V@suppilovahvero>
Cc: <linux-integrity@vger.kernel.org>, "Jerry Snitselaar"
 <jsnitsel@redhat.com>, <stable@vger.kernel.org>, "Todd Brandt"
 <todd.e.brandt@intel.com>, "Peter Huewe" <peterhuewe@gmx.de>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, <linux-kernel@vger.kernel.org>, "Patrick
 Steinhardt" <ps@pks.im>, "Ronan Pigott" <ronan@rjp.ie>, "Raymond Jay Golo"
 <rjgolo@gmail.com>, "Linux kernel regressions list"
 <regressions@lists.linux.dev>, "Dusty Mabe" <dusty@dustymabe.com>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, "Paul Menzel"
 <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v3] tpm: Enable hwrng only for Pluton on AMD CPUs
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Thorsten Leemhuis"
 <regressions@leemhuis.info>, "Mario Limonciello"
 <mario.limonciello@amd.com>
X-Mailer: aerc 0.14.0
References: <20230822231510.2263255-1-jarkko@kernel.org>
 <705b9769-4132-450b-bd47-2423c419db2a@molgen.mpg.de>
 <CV03X3OEI7RE.3NI1QJ6MBJSHA@suppilovahvero>
 <1eeddbdc-c1f0-4499-b3d1-24c96f42a50b@amd.com>
 <CV3J3TCMB74C.1WA96NQ9J593U@suppilovahvero>
 <f6d75cac-2556-484e-8a2c-3531b24b1ca5@amd.com>
 <fcf2f600-d1f0-de14-956b-4d4f3f0cb3fa@leemhuis.info>
 <116dd56f-695f-4ecd-dace-805db83f5c3e@leemhuis.info>
 <CVAHNI7PWVDL.W8194GZA0SMK@suppilovahvero>
 <8dc067e5-d81f-4c5b-be76-bf0c1227b71e@leemhuis.info>
 <CVG0VPRMC759.2LT3BCT7Q6M9H@suppilovahvero>
In-Reply-To: <CVG0VPRMC759.2LT3BCT7Q6M9H@suppilovahvero>

On Mon Sep 11, 2023 at 1:40 PM EEST, Jarkko Sakkinen wrote:
> Personally I think bugzilla, being user approachable system, should
> be better defined but *theoretically*, at least by the process, it
> can be fully ignored.

I.e. I don't think it should be ignored :-) </disclaimer>

BR, Jarkko
