Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8C8487B7
	for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZC7KZUv1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cfcc9b3b5cso9430565ad.0
        for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 06:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701353452; x=1701958252; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dE47Cw76xuUIfSQwDeLYhzziVg6LOr/m9eTrQ3RiaO0=;
        b=ZC7KZUv1cfHnIQEyEP+yQqQFp7gmTOxWB3X3m7pCGSyzW++U40an5Wc8qQJBR/FfV4
         rsk4csjwGV7vjuw6Dj4sm5mXW34qAninHgPh/QPCtTnFkx43Rvad4mCylMlwzBpfbUCN
         dPzmb5O6U3JWn3phQ0obHuV2NltzYwYYTlpUjRtyFyECPNKU5Ce3UtiqVfSAXNtNwhRa
         PdWCJ1gWoXbcVNa5nbbWcyy0ZzsukEg4KMW39TImJudxBGXmIgapR/QINhzbGZoCwQo+
         T6eNkLc1KRBxEEPw7LwCCxm4eRYiV3n4ONuA4EANDNBlsmqSfmZv0ijZuo5FkYaFlmGp
         I9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701353452; x=1701958252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE47Cw76xuUIfSQwDeLYhzziVg6LOr/m9eTrQ3RiaO0=;
        b=ZoaYqlsEDaaIhI6UTg5jTSK+4lR14tya38nMH87PV7U8KKb5zt+wB8nYB0olS9ej5j
         Fm9374JJr9liO5CjhGpb1K/v4TIt7P7m5Hy7wY8ntHN3BufRRWKLkILgsOozVWP2L+4+
         rn6Z7LxIn9ZfesJFAhix/va6JePw87sKpgkvF2MAlXZT+rDV4kK/En73hY2/0Waf79hk
         90KafLW9ATa9Z+wexjbbMR+QVyWBFNG8ilbfYlXzyXFHbaqP+OLUqgnyfUjYioHmZ5br
         j1guBiYmSKSX6HDehUaAoB3iXULwiMEEal32DOuwhqWvDWq2pRqE9rK1TEpmpXkjIoC7
         cicg==
X-Gm-Message-State: AOJu0Yxd5DjDB+A7aOICKf0x1Gnj22GvRFx+L6VDgvugLNMcyvvY3r9F
	Ce4WvEBhE5UIOsfrLmuYgds=
X-Google-Smtp-Source: AGHT+IGMndrqXnGMpG3E0OJhMK/QUwMXYTZLRWve5i8XYeazMaCtffkQZksUI0nQh9IW/slN22nM1w==
X-Received: by 2002:a17:902:e80e:b0:1cf:daca:2b5e with SMTP id u14-20020a170902e80e00b001cfdaca2b5emr14536787plg.38.1701353452299;
        Thu, 30 Nov 2023 06:10:52 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709027d8500b001cf89e69a70sm1401937plm.307.2023.11.30.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 06:10:51 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 4BC09102F908A; Thu, 30 Nov 2023 21:10:48 +0700 (WIB)
Date: Thu, 30 Nov 2023 21:10:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Shachar Kagan <skagan@nvidia.com>,
	"edumazet@google.com" <edumazet@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	"kuba@kernel.org" <kuba@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	Ido Kalir <idok@nvidia.com>, Topaz Uliel <topazu@nvidia.com>,
	Shirly Ohnona <shirlyo@nvidia.com>,
	Ziyad Atiyyeh <ziyadat@nvidia.com>
Subject: Re: Bug report connect to VM with Vagrant
Message-ID: <ZWiX6NtanFyx4lmw@archie.me>
References: <MN2PR12MB44863139E562A59329E89DBEB982A@MN2PR12MB4486.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lLgwSM4kOO8NeYim"
Content-Disposition: inline
In-Reply-To: <MN2PR12MB44863139E562A59329E89DBEB982A@MN2PR12MB4486.namprd12.prod.outlook.com>


--lLgwSM4kOO8NeYim
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 01:55:06PM +0000, Shachar Kagan wrote:
> Hi Eric,
>=20
> I have an issue that bisection pointed at this patch:
> commit 0a8de364ff7a14558e9676f424283148110384d6
> tcp: no longer abort SYN_SENT when receiving some ICMP
>=20
> Full commit message at [1].
>    =20
> The issue appears while using Vagrant to manage nested VMs.
> The steps are:
> * create vagrant file
> * vagrant up
> * vagrant halt (VM is created but shut down)
> * vagrant up - fail
>=20
> Turn on a VM with =E2=80=98Vagrant up=E2=80=99 fails when the VM is in ha=
lt state. When the VM hasn't been created yet, 'Vagrant up' passes.
> The failure occurs in the Net-SSH connection to the VM step.
> Vagrant error is =E2=80=98Guest communication could not be established! T=
his is usually because SSH is not running, the authentication information w=
as changed, or some other networking issue.'
> We use a new version of vagrant-libvirt.
> Turn on the VM with virsh instead of vagrant works.
>=20
> Stdout[2] bellow.
>=20
> Any idea what may cause the error with your patch?
>=20
> Thanks,
> Shachar Kagan
>=20
> [1]
> commit 0a8de364ff7a14558e9676f424283148110384d6
> Author: Eric Dumazet <edumazet@google.com>
> Date:   Tue Nov 14 17:23:41 2023 +0000
>=20
>     tcp: no longer abort SYN_SENT when receiving some ICMP
>    =20
>     Currently, non fatal ICMP messages received on behalf
>     of SYN_SENT sockets do call tcp_ld_RTO_revert()
>     to implement RFC 6069, but immediately call tcp_done(),
>     thus aborting the connect() attempt.
>    =20
>     This violates RFC 1122 following requirement:
>    =20
>     4.2.3.9  ICMP Messages
>     ...
>               o    Destination Unreachable -- codes 0, 1, 5
>    =20
>                      Since these Unreachable messages indicate soft error
>                      conditions, TCP MUST NOT abort the connection, and it
>                      SHOULD make the information available to the
>                      application.
>    =20
>     This patch makes sure non 'fatal' ICMP[v6] messages do not
>     abort the connection attempt.
>    =20
>     It enables RFC 6069 for SYN_SENT sockets as a result.
>    =20
>     Signed-off-by: Eric Dumazet <edumazet@google.com>
>     Cc: David Morley <morleyd@google.com>
>     Cc: Neal Cardwell <ncardwell@google.com>
>     Cc: Yuchung Cheng <ycheng@google.com>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
>=20
> [2]
> Vagrant up stdout:
> Bringing machine 'player1' up with 'libvirt' provider...
> =3D=3D> player1: Creating shared folders metadata...
> =3D=3D> player1: Starting domain.
> =3D=3D> player1: Domain launching with graphics connection settings...
> =3D=3D> player1:  -- Graphics Port:      5900
> =3D=3D> player1:  -- Graphics IP:        127.0.0.1
> =3D=3D> player1:  -- Graphics Password:  Not defined
> =3D=3D> player1:  -- Graphics Websocket: 5700
> =3D=3D> player1: Waiting for domain to get an IP address...
> =3D=3D> player1: Waiting for machine to boot. This may take a few minutes=
=2E..
>     player1: SSH address: 192.168.123.61:22
>     player1: SSH username: vagrant
>     player1: SSH auth method: private key
> =3D=3D> player1: Attempting graceful shutdown of VM...
> =3D=3D> player1: Attempting graceful shutdown of VM...
> =3D=3D> player1: Attempting graceful shutdown of VM...
>     player1: Guest communication could not be established! This is usuall=
y because
>     player1: SSH is not running, the authentication information was chang=
ed,
>     player1: or some other networking issue. Vagrant will force halt, if
>     player1: capable.
> =3D=3D> player1: Attempting direct shutdown of domain...
>=20
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 0a8de364ff7a14
#regzbot title: starting Vagrant VM fails due to not aborting SYN_SENT

--=20
An old man doll... just what I always wanted! - Clara

--lLgwSM4kOO8NeYim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWiX5AAKCRD2uYlJVVFO
o0msAP0YtPQj+1kQr2oLBrT2KntONODcf0o0IqmpNwpK64hDtgEArzAfTafqswql
hpTOqUdIWuz2TfZ3jaLej5JOpNHmJwE=
=mc86
-----END PGP SIGNATURE-----

--lLgwSM4kOO8NeYim--
