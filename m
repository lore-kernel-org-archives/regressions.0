Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F82185A
	for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 03:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Ctg91Ftn"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5be09107145so28878a12.1
        for <regressions@lists.linux.dev>; Thu, 09 Nov 2023 19:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699588271; x=1700193071; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHh7bkluawWKsjap1yDj+0nfP7N3z7lk0z3xAThudCo=;
        b=Ctg91FtnVx51NQJg3lGvnscH9NH9m9lm3TSfaaxsIqDiv06NDzXCBzOv8ES5XHw1Uc
         t6M4koTinDPOFECNKcjgVk6bMj0opLKOdTjANO/pVAIK44JQeYgSvmJgt3hEMBZ5QGji
         4E6gaEcVoeNPgIlhvHB1Ec1lE4SAc2NPbOm2UGZ7blm4ZtHAJggY98Oec9bVFmrJsyJX
         lO4J7TC3gtbvRVNdRCwmnOPlUjrGyhz40+2yQaom8hjRfKbOilEugp8G8tyirHXViuJ2
         Ln/SU7QuigBGYHx4c6bHc50AtlLMbwjY1mYbD8KCXk3kPfaNIoH4p33TNtIF2LH7qckg
         mU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699588271; x=1700193071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHh7bkluawWKsjap1yDj+0nfP7N3z7lk0z3xAThudCo=;
        b=wItYffbTtbgdXBWhvBvzo5ze6EbImEuwckM2e43P+w4AreRbmpeJET9aQjLtxpsNBh
         KpD7y0PPmrxck15LT25VhOOaJcmQKOzAia+FqB3FXy4Nmj1St+gVUQjyu9yoQBrH5wc4
         8e7fVapCIjAOg+wgswXJUK6SQLL2oDw2YZnMJ6q/F/UyhX7Xs6ngr2tvQKBpv9RqgGxg
         hDTAYmy0h7Tasdkodg4XKex4gZEiOHX1StYl/snM2FZwmQeCJBDZ+hume5pwAAdGzrNN
         Ipq/E0QdZ7cs1jtghSZYxr9mhQKOobdGWHPHoTFdBsdLexoNQyDFxOStFTnY44HOjSKh
         OjNQ==
X-Gm-Message-State: AOJu0YxZC/7pue207GqXWvQd8KzNSeCQviREqXg25g7TpQ5sKCOyD8cY
	PAfZb0PRTzcLcUNGk7dDkOis/UpTOHfyVamEzvlVIA==
X-Google-Smtp-Source: AGHT+IHicDVNuQPniCjE9iUBcmP7Bdq+RfmRDXJuwA1IowP/vgz0wPHlB2wDE+o3mNGfMIvHH/eeMg==
X-Received: by 2002:a17:902:d4d2:b0:1cd:fbc7:270e with SMTP id o18-20020a170902d4d200b001cdfbc7270emr3783025plg.2.1699588271379;
        Thu, 09 Nov 2023 19:51:11 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc32f46757sm4298233plx.107.2023.11.09.19.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 19:51:10 -0800 (PST)
Message-ID: <a29fcb47-de03-46a7-b4d1-47a6c9a28879@kernel.dk>
Date: Thu, 9 Nov 2023 20:51:09 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: tpearson@raptorengineering.com
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <9860f9b2-1d98-497c-9480-56852fda781b@kernel.dk>
 <1557819821.46044536.1699549241816.JavaMail.zimbra@raptorengineeringinc.com>
 <f4fffe29-7c95-4d22-918b-f2835fb76366@kernel.dk>
 <597693097.46047776.1699550641104.JavaMail.zimbra@raptorengineeringinc.com>
 <e3e1b31f-a9a0-4387-982e-aba6d9763c6b@kernel.dk>
 <1926532589.46050149.1699551411577.JavaMail.zimbra@raptorengineeringinc.com>
 <a262a91e-f2ec-402f-ba40-adacb76c72b9@kernel.dk>
 <871420600.46050861.1699551732591.JavaMail.zimbra@raptorengineeringinc.com>
 <99f43fc0-a500-41b5-9575-33a57d0795de@kernel.dk>
 <9867b2be9c0845f9f2e3a16f91f40574.squirrel@vali.starlink.edu>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <9867b2be9c0845f9f2e3a16f91f40574.squirrel@vali.starlink.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Just to go back to basics, can you try this one? It'll do the exact same
retry that io-wq is doing, just from the same task itself. If this
fails, then something core is wrong. I don't think it will, or we'd see
this on other platforms too of course. If this works, then it validates
that it's some oddity on ppc with punting this operation to a thread off
this main task.

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 64390d4e20c1..1d760570df04 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -968,7 +968,7 @@ int io_read_mshot(struct io_kiocb *req, unsigned int issue_flags)
 	return IOU_OK;
 }
 
-int io_write(struct io_kiocb *req, unsigned int issue_flags)
+static int __io_write(struct io_kiocb *req, unsigned int issue_flags)
 {
 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
 	struct io_rw_state __s, *s = &__s;
@@ -1092,6 +1092,19 @@ int io_write(struct io_kiocb *req, unsigned int issue_flags)
 	return ret;
 }
 
+int io_write(struct io_kiocb *req, unsigned int issue_flags)
+{
+	int ret;
+
+	ret = __io_write(req, issue_flags);
+	if (ret != -EAGAIN)
+		return ret;
+
+	ret = __io_write(req, issue_flags & ~IO_URING_F_NONBLOCK);
+	WARN_ON_ONCE(ret == -EAGAIN);
+	return ret;
+}
+
 void io_rw_fail(struct io_kiocb *req)
 {
 	int res;

-- 
Jens Axboe

