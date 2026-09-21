Received: from smtpout8.mo538.mail-out.ovh.net (smtpout8.mo538.mail-out.ovh.net [51.210.91.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77EA3F7A9F
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.91.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980540; cv=none; b=Lccmv8VFJANjfaD6UChGPbwvfFlqrOL7KV/9IfBEbMopUU5kDxIxj51N4tl6akrXo/kzokhAhdqbO8bSE+Jgu7lMGLpC1bU0PO4MyPj0rLK0RStyA3rN7/MjiBOnHrFpArOHDATFCFM+3S/WLJ/3ybqSkcPWxeGJUZg0WGzpv14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980540; c=relaxed/simple;
	bh=rqz7jJ1Pk9PDs1Y5Z/s29WEjz9SqDzasluUr/24w++Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t6kmisHcIr3p08dvPC7kLIQOVPlmhROB3Xs2qf5BnYGmeXDf+7mICvKqV3INNWJcLWlQuJBVzPm/hAKBgZCij81w1D7gmn9PGj3558++J5lOUkNanodbfV5l32WlW2lE+Tz9vIF2nBivdkXMqaQIe3Oqs8RD9C2Vx15RMPAl7ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=guillain.net; spf=pass smtp.mailfrom=guillain.net; dkim=pass (2048-bit key) header.d=guillain.net header.i=@guillain.net header.b=Egc2ClWX; arc=none smtp.client-ip=51.210.91.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=guillain.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=guillain.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=guillain.net header.i=@guillain.net header.b="Egc2ClWX"
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [79.137.60.221])
	by mo538.mail-out.ovh.net (Postfix) with ESMTPS id 4hpGTg1wYjz5xnV;
	Mon, 21 Sep 2026 08:23:51 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <jc.guillain@gmail.com>; Mon, 21 Sep 2026 08:23:51 +0000 (UTC)
Received: from mta10.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.101.67])
	by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4hpGTg0rjQz6Mbn;
	Mon, 21 Sep 2026 08:23:51 +0000 (UTC)
Received: from guillain.net (unknown [10.1.6.6])
	(Authenticated sender: jean-christophe@guillain.net)
	by mta10.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 8D635781C53;
	Mon, 21 Sep 2026 08:23:50 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-102R004e9826f5f-48d8-41c9-82bf-b49535e09579,
                    5F9990ABD353D1330F2597FFD0F913901C70D1FF) smtp.auth=jean-christophe@guillain.net
X-OVh-ClientIp:78.240.252.236
Message-ID: <3fd03263795d54ee4904a2bf6197a354ddee201f.camel@guillain.net>
Subject: Re: BUILD_BUG_ON failed for kvm_vmx struct size sanity check in
 vmx.c
From: Jean-Christophe Guillain <jean-christophe@guillain.net>
To: kvm@vger.kernel.org
Cc: regressions@lists.linux.dev
Date: Mon, 21 Sep 2026 10:23:49 +0200
In-Reply-To: <56a4bc35ee605588b7cc36c8e45c12b5f3b506cb.camel@guillain.net>
References: <56a4bc35ee605588b7cc36c8e45c12b5f3b506cb.camel@guillain.net>
Autocrypt: addr=jean-christophe@guillain.net; prefer-encrypt=mutual;
 keydata=mDMEaEmXaBYJKwYBBAHaRw8BAQdA1qyia8WH1pu6T8sC99WNMyKXooD/SVqJXsJOcnIux
 w20N0plYW4tQ2hyaXN0b3BoZSBHdWlsbGFpbiA8amVhbi1jaHJpc3RvcGhlQGd1aWxsYWluLm5ldD
 6IlgQTFgoAPhYhBDk2+TsBtH9ETCTubi9QTbKhgBdPBQJoSZdoAhsBBQkSzAMABQsJCAcCBhUKCQg
 LAgQWAgMBAh4BAheAAAoJEC9QTbKhgBdPrq0A/icNhFTYLybFWWq1B42UvJLGs18MNRiT5aLdFv3R
 DfHVAQCvzsLrC/qz4rOyIpDzeb0biOu3fiDTcyvV3kPiu3xTDA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
x-ovh-tracer-id: 16831922136477813539
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTGDE2i0OAm6Btzp4MWrl4JbwMYlsk+Anifd1gAO8onw/rhAnewfi9sZL08o55CgwvoweteNx7g3/7PulzcgPcL2j2Jq/MgK/bfTGphV6ug0ZzQ/rfdsXoaoSvPG3h3fLk/S36Y8l1gOBxNZTZ6n+h6i40jHcnOO3bpu3D9sKxSWLyEL4okR2Djfw4u+smPw5Z0aR589/VCnR7i9t+XWPM+xlWzmqVc3RgBnUG+s4HZiOax523Ag/m4VqGG/ze3mCfBrk+w0jfYlKsNq+j0il9Rs5OSNfBqr6nwW9VuJ4bniK7nNYRtSIaI5C+iwCSmiEViZN01icRoOYi2ID9tmvyFAqQN9bTr4sUNaiw1eReGgIOSOWbNcYs01xP34ZYOMtZiQpWdVMZd89YqzIaX4IRSUH3Ll19SUArKE8tN5M8GmJpcPjS+qWB8Yk1ZZNRYf4DjOgLnqaZk0SPVRU8kappt1zlIROsC085EHBwr+7Zbr4PRhcKKk+R9V5IndPO/HgkxI20xg0hK3mYKed1MybsA0aLHyiQM5Ybna9GLgwVmdmkbQSJAbaIzrn7nr15SLBI7f5Pi6CCN7cUH+aVW1iPAd/UF82r7ywHhnDPtPNJMrtqVh4Iu2u147+6yO3lBRrCU8EWstPm0h1vRp6U3GmENW6I7304/yVWvnxE33mt3Izw
DKIM-Signature: a=rsa-sha256; bh=rqz7jJ1Pk9PDs1Y5Z/s29WEjz9SqDzasluUr/24w++Q=;
 c=relaxed/relaxed; d=guillain.net; h=From; s=ovhmo31693-selector1;
 t=1789979031; v=1;
 b=Egc2ClWXQ9JwLgHmLobojqa3f9dUr1dI2ZPzXsceX3CpPmDZzlYZ/R0UpsFKNXOU8GISG3I3
 fsrD3B/rYNrnCgrXJyFNGjWnwpZ0poaIeMtMG1h8JMsM251v68VaajmEBkFVAaF6Cl2W++VkS2o
 8wH1sAuPqW5FguoMJ4Pp8gZhyna6uMKt1pYOg1vNNnEN7i/hsyyFRlGQmgoVaMj/Iir7b8SLB/J
 X32BnckXUmpMobCDQ42UY9mDE1dMcuN7hpUVenGnH0hqgIm0YyiHlRBvEJhD1Jv+nYgW2gy9Fea
 0A+/0uFozLyxq0JelD1qcTcr4fejqRxT84io2mZpA/29Q==

Hello,

Adding regressions@lists.linux.dev to CC and registering this report
with regzbot for tracking.

The issue was introduced by commit 97d65b544f48 ("KVM: Check for
duplicate vcpu_id as early as possible").

Sean has since posted a patch series addressing the issue, which I
tested successfully on my system.

#regzbot ^introduced: 97d65b544f48

Cheers !
Jean-Christophe Guillain
