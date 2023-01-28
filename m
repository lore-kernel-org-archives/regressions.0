Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FB72F47
	for <regressions@lists.linux.dev>; Sat, 28 Jan 2023 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674925809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=HIRSOZVh//gsInC5jS540d1d6Q+sO5WiOYvg9x5Ssl8=;
	b=KdCmO+B1YycL/lM80A7MkxvrlpFW/IDieUJvXydzDSRXwKXyVNAQQcieuNu2oB5TKqaX7F
	NSDKP7apUnZaxRIxQsGpNdhF6QQtvAB2Rw0HALkaTQ48ZohlH50Gu9ebWY+f28idNkGnMR
	XHQEAsRlH3sDDz414Y+q7jlSn0ieXCA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-KdDkdWjXMACeWf2vEAu5hg-1; Sat, 28 Jan 2023 12:10:06 -0500
X-MC-Unique: KdDkdWjXMACeWf2vEAu5hg-1
Received: by mail-yb1-f198.google.com with SMTP id z17-20020a256651000000b007907852ca4dso8739268ybm.16
        for <regressions@lists.linux.dev>; Sat, 28 Jan 2023 09:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIRSOZVh//gsInC5jS540d1d6Q+sO5WiOYvg9x5Ssl8=;
        b=b5S/r30mNCNM9O6ZrdtezvPqHhnSZioRzJX8du8UlzS5+Ng1LT3RH0uzMXKYURILA9
         zC87tBELB5hzh6ABrTQmB4+GbUJX1lvNVnWVJsuJyDXCZHtWULJDn8OOJfooIJHpj8+A
         wQtM6DDmULK2wv2YjjFpqggil1nJzMZQPPDAlB68dZbNI5kaseJtVJ+zeSmr9Nch2+UE
         rtTGy6IK1Hc3IqsVOFLXUbeK9H6TuHVzrDqWqRPQbdnzpcjqx88bpWejopQ8Ot/PJiDt
         fjlurAW60giQ3uU/hC86sUqEKH0Vzs0SSZIZMUMgdhfTqY27flRPmc36IKFzkLGUM4Cm
         37BA==
X-Gm-Message-State: AO0yUKWPqnI9XJv6udZGen9ik/oX+Wa+AmyalnpJ0UhuOu5x86U2hqHy
	MwnsetxjyLgQ39TO2aD9dD4IhPXRe0l3JviB6wEg9BPhnvUlmfDvSjjkraFQbP20dhzpjKnyWQ7
	rKkD8LhjukCANNhm4tDfPfUhWM6gTnCLG69Nybls=
X-Received: by 2002:a81:9a55:0:b0:509:bd6:4d4b with SMTP id r82-20020a819a55000000b005090bd64d4bmr964494ywg.282.1674925805756;
        Sat, 28 Jan 2023 09:10:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/Ti2FW7plMNR419sOkWM8O61U20pvs2B2S2qscenkXti1FnKmTt5RWb12r2oix5/26lKno9SC2kj72byBRtiM=
X-Received: by 2002:a81:9a55:0:b0:509:bd6:4d4b with SMTP id
 r82-20020a819a55000000b005090bd64d4bmr964490ywg.282.1674925805580; Sat, 28
 Jan 2023 09:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jason Montleon <jmontleo@redhat.com>
Date: Sat, 28 Jan 2023 12:09:54 -0500
Message-ID: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: gregkh@linuxfoundation.org
Cc: casaxa@gmail.com, cezary.rojewski@intel.com, lma@semihalf.com, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

I did a bisect which implicated
f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 as the first bad commit.

Reverting this commit on 6.1.8 gives me working sound again.

I'm not clear why this is breaking 6.1.x since it appears to be in
6.0.18 (7494e2e6c55e), which was the last working package in Fedora
for the 6.0 line. Maybe something else didn't make it into 6.1?

