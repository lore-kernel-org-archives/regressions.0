Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7BF183CC2
	for <regressions@lists.linux.dev>; Thu,  1 Aug 2024 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722529542; cv=pass; b=omhBTXM07RwQTZeTPxWj8SfRdbEQc7aQeojnVuuFVzpo9/FcXc9CYsNuF2Cxat6ZeFvSAs/qiyYg6E8qWeBZ/UKXvp5K/MuX3okGKcfcaSYCHFLv6JtAnXJyIESf7ZeuJF6wyQZcZUQlR5ZQp+ES5GToR42evdmTzUAHWrD8eOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722529542; c=relaxed/simple;
	bh=zQPo2zJcwoNEbYJLVtndtzeqqUhTziU9DHdmAZIqyrg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=SP2PBTQSB29golIe3LA29CTgl7uw+DSukIyL5/6zGFWqzhwwielwMoYrIgc5ndAVoR+a8p/1ZYIRv4wVGcp1GhvcKFH6ZpLAepWQr4IXDTulJZCRYBD93R/SFNA84HQxkzg+MgZSftb1KAFMlXoTlhktFTh6LVd8bVAd26cF0Tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=HU6/RmqV; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="HU6/RmqV"
Message-ID: <c095559def052b738f040ffb52400e75@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722529532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjhXgEerCShU5LYVdSkfuK0ArlHKeZ3+kVUKZObqmIk=;
	b=HU6/RmqVZRBADAtop5FvUm4HqnIZZPkvgoh7xOKktO8hotxg21VM9puwhUAIKHkP9QPeyk
	R8wk2JFsFMDBZmHCJmkV8asxD8zq0Do6G1V2x14Ut0Z/DoNE8sft2sqXU4vfKo874K80II
	Yv40WtQ8jMHZ/ojji9KT6TAYBogwMi0DC5JoeLaq9T9CCsz7A9RaHsTzk8ciifziCLflmV
	OgewSGIGM5vDY00TWmQLbzRxd2hHRtwegN4mFba+qMu8SxCLg6g4utQ56812Uaf55Qeu84
	jJ23EgnfsgLo6taa5IPPwtZUtfPxw+zOotxdFY2h+jzf5zTkqRcODbqabquFyg==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1722529532; a=rsa-sha256;
	cv=none;
	b=eZnG6W+ya/a7xMkEtci+QXYT3VpX7RiMeOK1uAbGA6/aAkZOxqp/sPo2r2EhtY/q/IgtBa
	XCX1rURzc/BztPS8rauxH7avkx7UTRkQi9jVlb1llHW4zGLh07HBnyQ9qDcSw0En4QaVW+
	94Ry4tH8dQfHHCACoUHYicV8IPE/PLrpZPmdZr9cx1qtrIxUE+cDNxHgv1ls2K5LcOqf2y
	7xFt7Nmm9yTSOaqI+XzbQNVBNGrJomPHoz7fxO11yt4t7Avd3NzVNMtTVVNIHEqnEp/lfd
	kBzxvrZX1jpVFKISH+DJNMxaoKhhThjkbSK/o4i9z+pQmGZp/TJMUVxLwoHqkw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722529532; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjhXgEerCShU5LYVdSkfuK0ArlHKeZ3+kVUKZObqmIk=;
	b=KxjlrVidK2sW0+GRgglPugj6vQnOqqaPKaEr97M9ow5+P8IJtXrTLukBXQHXSsHY/z0HDS
	XCW/zDR2WpI1TBT742OfkVwyx+h1sZ3SdXJ1PHG4CDOPwy7qKyyu4ZMJ7vprpqqlPLcE7C
	UtWhMajvqxycFi96c4KrkJyt6uW0HiBOERcOzBlSY4HMiNaj6PUj+W3Rs8xrhd/UiAAH4+
	r6P6aYbdtPs3+5/Wb0z3kr956ZkprUW6TlFFfvl6JM5fgp0BNhJGLjM5UWJVMgF+cU779u
	uw4TL9QVjJIVU5K0q+rMg6VBDUWAUTkpwtircCBiIQqO6Z98MDuVx8wqc6YyAg==
From: Paulo Alcantara <pc@manguebit.com>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C_Sebastian?=
 <Sebastian.Steinbeisser@lrz.de>,
 "tom@talpey.com" <tom@talpey.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Cc: "smfrench@gmail.com" <smfrench@gmail.com>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
In-Reply-To: <7be5122d65dabd96a28a71678ca0efb93cbe749f.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <dd0259752e3557fa1b60dda4db3bf790d9ff877c.camel@lrz.de>
 <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
 <98d458ba-4258-4598-b8fc-0fe6cfeb2f87@talpey.com>
 <2849de0676a015619b922708005a243595f9f56b.camel@lrz.de>
 <6db3dbb8a7a6f4f5ed0f63d0e0c784c7@manguebit.com>
 <8bf2462eb9aa4d30b866da57720a36c90c0a43df.camel@lrz.de>
 <d208a9307b32ccf4d3fd7b08c6b95445@manguebit.com>
 <aed542086314197bcec6a50c7d6ee76cb6e65f96.camel@lrz.de>
 <ac58f36e10af65cd672fba66e99faa2c@manguebit.com>
 <1359665240338585cfbc4eac58339ab1d0423788.camel@lrz.de>
 <ff47edb26e0cd9e591cfb3ece2407971202dfc09.camel@lrz.de>
 <ff56ae33c66856c0cf21b4049dc84bcb@manguebit.com>
 <7be5122d65dabd96a28a71678ca0efb93cbe749f.camel@lrz.de>
Date: Thu, 01 Aug 2024 13:25:28 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Steinbei=C3=9Fer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:

> thank you! I've poked our NetApp rep. again hoping to get some
> technical answers out of them finally ;)

No worries.  I've been there :-)

> With the additional patch applied I can access signed & encrypted
> shares as well as the test share from which the logs are attached.

Thanks!  This just confirms that FSCTL_GET_REPARSE_POINT against NetApp
indeed requires the FILE_READ_EA bit being set and it has never worked
since then.

I'll send an additional fix shortly to make FSCTL_GET_REPARSE_POINT work
against NetApp.  I've tested it against Windows Server 2022 and it works
with FILE_READ_EA bit set as well.
