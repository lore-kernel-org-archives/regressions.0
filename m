Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE336A
	for <regressions@lists.linux.dev>; Thu, 17 Aug 2023 03:05:26 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6887b3613e4so1450437b3a.3
        for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 20:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241526; x=1692846326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dCFr8g9hdLn/Gp4gsKaWBuVjf1qv2s3SUk7n6KsdUV8=;
        b=kFvA+/uYbXJhT1Z/qEl3KNHdWxyHpauLcp8EkGsy2iRidsBEdGP+UbU/Dl7lrZ52bx
         ia6JpQkfARQ+4X/Zh4fOkgWLSJZyjhyL1ZpA9YfbdwfO5OeKcegRI8G1Sbzf83eM+RE/
         nbHaCgs7df1gkz9MIep84xRw2QynwQCOyfLEu8yVZo5l+EImf8VXF0rtnkXvC6tfEwue
         wUGE/C6a9eVkBZc7NMGhVtkz88ToEuCnoPONvQw4WDrFG83EStVWt0984n3nLKsIpcr3
         9xTG+5hxAX9RxZWm28TGyUbhSsdmz18tne6Wn5Bqe16FnupFtx5arzQIBw1Bo6LKUJ2g
         3zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241526; x=1692846326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCFr8g9hdLn/Gp4gsKaWBuVjf1qv2s3SUk7n6KsdUV8=;
        b=CyA53iaCSDnUcqWcFmLo0yTceCC8cZcRvLsNPnvVy3Fhbz6hH8wjI387CcY+vzTeNo
         ciYNMyE/7pR1EN2qVzMjlXcbEzyhmN6ByGWIZzFZGcUkFshMPKv3ThiEAVZKNx3JND30
         0rMKsz13CJ5D2f5EuODofza4ftgaAqaetmn5bFwiC00WzpdrWHMTMVjOr7ddNvRHkict
         A26ahyzsREg6/17zgGX2EOXRCfD4V32bdDC+R4Nd85AWMgQOhOwSF8nEOzIO094a22pU
         uQ1cHZa8jjlWIah8jN8ZNKEKDGg/a4sJfL7Y2WvMmm6HSpKXW3Ta/phPwmrSeR/QjYdY
         Z2fw==
X-Gm-Message-State: AOJu0Yx4tkRQ/YSHfszR0vEk2kq6fEtjfljpe88O90YUukz7sBEeD3x2
	DPbp6sq1CbWElD10GBEUMnXUAElpO1o=
X-Google-Smtp-Source: AGHT+IETBzR9WoDYjAItJOFnPkvUwNYF7LdkIhh4kX0jJrAh1V7y+63blNn3Wsfx5Xj+E0+SlJCn5g==
X-Received: by 2002:a05:6a00:2443:b0:67e:18c6:d2c6 with SMTP id d3-20020a056a00244300b0067e18c6d2c6mr4459017pfj.5.1692241526286;
        Wed, 16 Aug 2023 20:05:26 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id x52-20020a056a000bf400b0068883728c16sm2033018pfu.144.2023.08.16.20.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 20:05:25 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 8CFF081A1A74; Thu, 17 Aug 2023 10:05:22 +0700 (WIB)
Date: Thu, 17 Aug 2023 10:05:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Roman Mamedov <rm+bko@romanrm.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>
Subject: Re: Fwd: kvm: Windows Server 2003 VM fails to work on 6.1.44 (works
 fine on 6.1.43)
Message-ID: <ZN2Ocgp63T0FBuZn@debian.me>
References: <8cc000d5-9445-d6f1-f02e-4629a4a59e0e@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g0oVnqwyBJRa495L"
Content-Disposition: inline
In-Reply-To: <8cc000d5-9445-d6f1-f02e-4629a4a59e0e@gmail.com>


--g0oVnqwyBJRa495L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 04:29:32PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v6.1.43..v6.1.44 https://bugzilla.kernel.org/show_bu=
g.cgi?id=3D217799
> #regzbot title: Windows Server 2003 VM boot hang (only 64MB RAM allocated)

#regzbot fix: https://lore.kernel.org/all/20230811155255.250835-1-seanjc@go=
ogle.com

--=20
An old man doll... just what I always wanted! - Clara

--g0oVnqwyBJRa495L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZN2OcgAKCRD2uYlJVVFO
oyq8AP9v83lAaDlucHZrPAnwXNC+EsVLyLoms0sKBos74GjFrwD9F11N/ZQ3z2vo
Y2cwCA+IBOnWxlFcH8eQD5c82J0wVAw=
=U376
-----END PGP SIGNATURE-----

--g0oVnqwyBJRa495L--
