Received: from mail.linuxsystems.it (mail.linuxsystems.it [79.7.78.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061FC2597
	for <regressions@lists.linux.dev>; Fri, 12 May 2023 08:59:09 +0000 (UTC)
Received: by mail.linuxsystems.it (Postfix, from userid 33)
	id 8FE56215913; Thu, 11 May 2023 19:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxsystems.it;
	s=linuxsystems.it; t=1683825926;
	bh=yhp7v3luRGJ6mq7f7i4QZFLveEgF64yIuE8ANbdh7GA=;
	h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
	b=l1b8aQpTATQR13/g/283QB5g1vVSF33CfqUnpPF7R0RUk2S+daOGymYtQIpZjIh1u
	 06SQLvNI2ryQZzryPHkJm2WDq6ccI50rSgLnWQWuxz339kF+r8ty1Z9w/m97zX6SXM
	 UFYKxruaQcQvqqcNG2kKtcaod6rVcMDLGEsqhMOA=
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to  read user page (1128) - exploit attempt? (uid: 0)
X-PHP-Originating-Script: 0:rcube.php
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 11 May 2023 19:25:26 +0200
From: =?UTF-8?Q?Niccol=C3=B2_Belli?= <darkbasic@linuxsystems.it>
Cc: Linux Regressions <regressions@lists.linux.dev>, Linux for PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux AMDGPU
 <amd-gfx@lists.freedesktop.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Alex Deucher
 <alexander.deucher@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, Qingqing Zhuo
 <qingqing.zhuo@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Daniel Wheeler
 <daniel.wheeler@amd.com>
In-Reply-To: <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com>
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
 <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com>
Message-ID: <a50537d1f1af34104793218acb954a61@linuxsystems.it>
X-Sender: darkbasic@linuxsystems.it
User-Agent: Roundcube Webmail/1.1.5

Il 2023-05-12 10:32 Bagas Sanjaya ha scritto:
> #regzbot introduced: f4f3b7dedbe849
> #regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2553

It doesn't look like the aforementioned patch made its way into 6.3 yet:

niko@talos2 ~/devel/linux-stable $ git branch
* linux-6.3.y
   master
niko@talos2 ~/devel/linux-stable $ git show f4f3b7dedbe8 | patch -p1
patching file 
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
Hunk #1 succeeded at 227 (offset 15 lines).
Hunk #2 succeeded at 269 with fuzz 2 (offset 19 lines).
patching file 
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
Hunk #1 succeeded at 49 with fuzz 2 (offset 15 lines).
