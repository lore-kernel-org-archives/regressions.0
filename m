Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F70B14F61
	for <regressions@lists.linux.dev>; Fri, 18 Aug 2023 11:12:40 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a7e68f4214so529212b6e.1
        for <regressions@lists.linux.dev>; Fri, 18 Aug 2023 04:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692357159; x=1692961959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Khwz4zTp6MJ6PWK+A13n2it+/5tcAZGPGUfEiyppD6M=;
        b=mUCaI/ez38e9bNbQRf3z8GPGtiWc1nKM1Hgv/O0SWm8rGzSlZ0swl+XOvnOd87c+E1
         dzTPdjRnLm0e9jR43NR1B2Z1GXZ7LjXNA4+6efAJqqs/048z3YsC12hgo2cLoqLhLYlp
         FGptIeFpIwFIzvQMHHU1VBn4Fx2PJG9w+9EhzeR3OsmtZnzTf5FpLsOXxDFkXie2REDr
         Y2ldEPv7ejHIfgeD8hKIZ3y/CriKd3tJHHJSve6phTaLCtIM97qkLV46y6BzNwNxdabt
         OLAPsesWHhK4WD3c7BXN96r9C4Ckg3arAtzRcK6DDt9MLIygZyS4mWyzDZazdTVbQQvY
         oTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692357159; x=1692961959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Khwz4zTp6MJ6PWK+A13n2it+/5tcAZGPGUfEiyppD6M=;
        b=fvnfFUCqstllMBHcR/kN39XCrSOdSrMnqyW+EorAJgy3iCUhpi9t15Dm3j/1P2S2UO
         foHhR26u0R/HkdrHqTHoMZPAZLyVj/IiKvRIR/tnMjAVtD+ryqBO4fExjWSLkSa/20Hb
         orpJotiJfCpgdCTpfY9PWUIFVFbh3IM3AXiZJitDEaCNqQuAMY6Tl47dRKm0dgku6oCs
         q5guRfvyHX0kpqEUmEShhz/xEVYk5uR+psEaTTREiTVh5BMnCjOwaYxB8h+/9jmphwro
         EWHuzseW/e6CxHqmBOY0bvHCu8nY+MjidaBhXGteq5+p+rqx3mY3UlXMHuYrKqOwwfCH
         ACdQ==
X-Gm-Message-State: AOJu0YykbyIZBMOjOZHaoL5PysMa1ncym27d7ee/bMhENAysXwDQCt+S
	pjRdoKoa/LQKprOdQps+dW4=
X-Google-Smtp-Source: AGHT+IFEazWZG6MmX2ZZk7rM68ZYWmpLbl9yHN9X65owHjmeeVv92KZ4B++/1C5UXZjE7J5qBALiyQ==
X-Received: by 2002:aca:120f:0:b0:3a3:eab8:8c40 with SMTP id 15-20020aca120f000000b003a3eab88c40mr2157828ois.54.1692357157828;
        Fri, 18 Aug 2023 04:12:37 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id x26-20020a63b21a000000b00553dcfc2179sm1282764pge.52.2023.08.18.04.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 04:12:37 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id C6A9D9DAC846; Fri, 18 Aug 2023 18:12:33 +0700 (WIB)
Date: Fri, 18 Aug 2023 18:12:33 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Fiona Ebner <f.ebner@proxmox.com>, linux-kernel@vger.kernel.org
Cc: siva.kallam@broadcom.com, prashant@broadcom.com, mchan@broadcom.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, jdelvare@suse.com,
	Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
	linux-hwmon@vger.kernel.org, keescook@chromium.org,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: "Use slab_build_skb() instead" deprecation warning triggered by
 tg3
Message-ID: <ZN9SId_KNgI3dfVI@debian.me>
References: <1bd4cb9c-4eb8-3bdb-3e05-8689817242d1@proxmox.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvRWUCzAIjldd1ag"
Content-Disposition: inline
In-Reply-To: <1bd4cb9c-4eb8-3bdb-3e05-8689817242d1@proxmox.com>


--lvRWUCzAIjldd1ag
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 10:05:11AM +0200, Fiona Ebner wrote:
> Hi,
> we've got a user report about the WARN_ONCE introduced by ce098da1497c
> ("skbuff: Introduce slab_build_skb()") [0]. The stack trace indicates
> that the call comes from the tg3 module. While this is still kernel 6.2
> and I can't verify that the issue is still there with newer kernels, I
> don't see related changes in drivers/net/ethernet/broadcom/tg3.* after
> ce098da1497c, so I thought I should let you know.
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: ce098da1497c6d
#regzbot link: https://forum.proxmox.com/threads/132338/

PS: The proxmox forum link (except full dmesg log pasted there) is in
German, so someone fluent in the language can be helpful here.

--=20
An old man doll... just what I always wanted! - Clara

--lvRWUCzAIjldd1ag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZN9SGQAKCRD2uYlJVVFO
o0TGAP93b0BAQsrPftlreCxezeMkGyoETtVZD/Bh6ikkhhbkmQD+LsOW9AHgHArX
CYWd86fU6Na6NAt8Hkpz0iw07tDG4Qg=
=RLLk
-----END PGP SIGNATURE-----

--lvRWUCzAIjldd1ag--
