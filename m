Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B9933EE
	for <regressions@lists.linux.dev>; Mon, 20 May 2024 06:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716187001; cv=none; b=QylxrKbws4+lZHTO04P/dcc/uPwW463dDMVC73TVmPecU+YT+dnMCx3KcUq6KFVPEvjeBlcDMyhA9gcvUA6MDX8CVMGQRW6LKa5RwOKVdW2DGja6KA9E5+gXyqLNxr5XrB/uxfv4aHcHmdLVI+lhXwJUPRXYRkfUKNu9qj9a3Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716187001; c=relaxed/simple;
	bh=8hIuiD7qtV4Mnxbl3HvUAw2mP8pGbgWxph/2BxM44Zk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=G24i9R4VhlLN2ryR7dEAMSEuT217WV+sbx2nLbXX2m01I2Jjn0KTYZ0hGQw7F4Ia6jlBIZeXwMiUBLopGUSlOqDD60lUAgYLW8QYWb7itYbAgsZgmH4HK38l+XIqIVKaRs+Os18CqgdXZ9jZx370G78kyQIBqTo5Sr4Tc1tUbU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.3] (ip5f5af1d0.dynamic.kabel-deutschland.de [95.90.241.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4B06861E5FE01;
	Mon, 20 May 2024 08:36:19 +0200 (CEST)
Message-ID: <259f7a87-2692-480e-9073-1c1c35b52f67@molgen.mpg.de>
Date: Mon, 20 May 2024 08:36:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier
 <nicolas@fjasle.eu>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, regressions@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: lib/build_OID_registry: Bareword found where operator expected at
 ./lib/build_OID_registry line 41, near "s#^\Q$abs_srctree/\E##r"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Uwe,


Your commit 5ef6dc08cfde (lib/build_OID_registry: don't mention the full 
path of the script in output), causes the build error below:

     Bareword found where operator expected at ./lib/build_OID_registry 
line 41, near "s#^\Q$abs_srctree/\E##r"
     syntax error at ./lib/build_OID_registry line 41, near 
"s#^\Q$abs_srctree/\E##r"
     Execution of ./lib/build_OID_registry aborted due to compilation 
errors.
     make[3]: *** [lib/Makefile:352: lib/oid_registry_data.c] Error 255

gcc (GCC) 12.3.0 is used.


Kind regards,

Paul


PS: This is found with `git bisect`, but reverting the commit on top of 
master also fixes the build problem.

5ef6dc08cfde240b8c748733759185646e654570 is the first bad commit
commit 5ef6dc08cfde240b8c748733759185646e654570
Author: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Date:   Wed Mar 13 22:19:56 2024 +0100

     lib/build_OID_registry: don't mention the full path of the script 
in output

     This change strips the full path of the script generating
     lib/oid_registry_data.c to just lib/build_OID_registry.  The motivation
     for this change is Yocto emitting a build warning

             File 
/usr/src/debug/linux-lxatac/6.7-r0/lib/oid_registry_data.c in package 
linux-lxatac-src contains reference to TMPDIR [buildpaths]

     So this change brings us one step closer to make the build result
     reproducible independent of the build path.

     Link: 
https://lkml.kernel.org/r/20240313211957.884561-2-u.kleine-koenig@pengutronix.de
     Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
     Cc: Masahiro Yamada <masahiroy@kernel.org>
     Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

  lib/build_OID_registry | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
bisect found first bad commit
