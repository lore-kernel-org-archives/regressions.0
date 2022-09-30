Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B8D1FDC
	for <regressions@lists.linux.dev>; Fri, 30 Sep 2022 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wYwXLKxFel9OtBvaifGAntl+vidc0DAlwXQv8644GeQ=; b=jNPtDuS+sD/QqMTaKWqG71mATu
	QkIZHjx2ncIrytdvMfWb9UvX0+XhuFgxlf3ocm0nfD9No4xaGjrP/gx3epVPb463TUoPelSCaFo+w
	GVViad3g4gUITcqcbpwaSgbpP+CYnC7RQRtTgYrh+eZI6LlmfRIajE4Ab1kpVSvpMcHr+L2/kDuQh
	6LUw5O1M8+ONJhYuHjV+HCMs1u7dZnTFwTyjN+p5886eRxsm2TuvO6ei0aDXXDjS9AgezN3QOBlnM
	eCTqOfddoVm3aykFvc5gS0dUJuJ8HHqmxY4kJ5zX1YndmdEcN/KjLHxvkllL5PlL0+QmrTw++CELW
	m+2L8txQ==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:64771 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1oeDvN-002WwY-W7;
	Fri, 30 Sep 2022 07:11:22 -0400
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Regression on 5.19.12, display flickering on Framework laptop
From: Slade Watkins <srw@sladewatkins.net>
In-Reply-To: <YzaFq7fzw5TbrJyv@kroah.com>
Date: Fri, 30 Sep 2022 07:11:19 -0400
Cc: Jerry Ling <jiling@cern.ch>,
 stable@vger.kernel.org,
 regressions@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <03147889-B21C-449B-B110-7E504C8B0EF4@sladewatkins.net>
References: <55905860-adf9-312c-69cc-491ac8ce1a8b@cern.ch>
 <YzZynE2FAMNQKm2E@kroah.com> <YzaFq7fzw5TbrJyv@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - premium237.web-hosting.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sladewatkins.net
X-Get-Message-Sender-Via: premium237.web-hosting.com: authenticated_id: srw@sladewatkins.net
X-Authenticated-Sender: premium237.web-hosting.com: srw@sladewatkins.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched

Hey Greg,

> On Sep 30, 2022, at 1:59 AM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>=20
> On Fri, Sep 30, 2022 at 06:37:48AM +0200, Greg KH wrote:
>> On Thu, Sep 29, 2022 at 10:26:25PM -0400, Jerry Ling wrote:
>>> Hi,
>>>=20
>>> It has been reported by multiple users across a handful of distros =
that
>>> there seems to be regression on Framework laptop (which presumably =
is not
>>> that special in terms of mobo and display)
>>>=20
>>> Ref: =
https://community.frame.work/t/psa-dont-upgrade-to-linux-kernel-5-19-12-ar=
ch1-1-on-arch-linux-gen-11-model/23171
>>=20
>> Can anyone do a 'git bisect' to find the offending commit?
>=20
> Also, this works for me on a gen 12 framework laptop:
> 	$ uname -a
> 	Linux frame 5.19.12 #68 SMP PREEMPT_DYNAMIC Fri Sep 30 07:02:33 =
CEST 2022 x86_64 GNU/Linux
>=20
> so there's something odd with the older hardware?
>=20
> greg k-h

Could be. Running git bisect for 5.19.11 and 5.19.12 (as suggested by =
the linked forum thread) returned nothing on gen 11 for me.

This is very odd,
-srw=
