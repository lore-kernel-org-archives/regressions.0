Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6C025760;
	Mon,  4 Mar 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709549600; cv=none; b=mS62+xNje6DuTtFFB84PbNorVJkXz56y8n19H9IN4yWAuy8LvF5dxquha4Dp7pux0gApBPLf/bvcU5HFQRua6i0uKnM4yW4jmcEd4W/YlhxRrsh2fO3SE8nUf+q80MZkUQ3JnpbtewodYsTBfvnJA0NyAY6ofA8eiBKDMaXiiJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709549600; c=relaxed/simple;
	bh=rksqeQokSo+e66c4a+aZCMPlTjkJrCtnfmnxKV88Oo8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=fC8i+qFFMcKLDwkU+/6HuOUc0D4bAnjVWegNZYhzyg2/wwg0vaC00rY1/KMjhzlY2ByjD4B3Qi9opXCDQn5HSINF7/dcDePnVnNs8vfxOEqfwrllIsSxzVA0xEZ7c1OPOAfb10zeVE747NodrKla0NCik8Hna6xTvVWbmmoDuw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XNr4uG3N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XNr4uG3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9439FC433C7;
	Mon,  4 Mar 2024 10:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709549600;
	bh=rksqeQokSo+e66c4a+aZCMPlTjkJrCtnfmnxKV88Oo8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=XNr4uG3NNN3hrc4GHqMZ+k+UFPgAcnyWBKL+PPVgorD1/SBmAa2xlrbOUkumtFB+6
	 k0+F4num/UY78lp++BQC7kYlpBYFdhHo7pCZkbzwPo6Dod69KEB7MHkb23IrO+W2KW
	 ChQbYT/SkHFd0EAnFRWJNCnRSUgxl1DKXdKeJpX8=
Subject: Patch "Revert "drm/bridge: lt8912b: Register and attach our DSI device at probe"" has been added to the 5.15-stable tree
To: gregkh@linuxfoundation.org,max.krummenacher@toradex.com,max.oss.09@gmail.com,maxime@cerno.tech,regressions@lists.linux.dev,sam@ravnborg.org,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 04 Mar 2024 11:53:09 +0100
In-Reply-To: <20240228145945.2499754-1-max.oss.09@gmail.com>
Message-ID: <2024030409-moonshine-siesta-1746@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    Revert "drm/bridge: lt8912b: Register and attach our DSI device at probe"

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-bridge-lt8912b-register-and-attach-our-dsi-device-at-probe.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From max.oss.09@gmail.com  Mon Mar  4 11:51:26 2024
From: max.oss.09@gmail.com
Date: Wed, 28 Feb 2024 15:59:45 +0100
Subject: Revert "drm/bridge: lt8912b: Register and attach our DSI device at probe"
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, gregkh@linuxfoundation.org, sam@ravnborg.org, maxime@cerno.tech, sashal@kernel.org, Max Krummenacher <max.krummenacher@toradex.com>
Message-ID: <20240228145945.2499754-1-max.oss.09@gmail.com>

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit ef4a40953c8076626875ff91c41e210fcee7a6fd which is
commit d89078c37b10f05fa4f4791b71db2572db361b68 upstream.

The commit was applied to make further commits apply cleanly, but the
commit depends on other commits in the same patchset. I.e. the
controlling DSI host would need a change too. Thus one would need to
backport the full patchset changing the DSI hosts and all downstream
DSI device drivers.

Revert the commit and fix up the conflicts with the backported fixes
to the lt8912b driver.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -571,6 +571,10 @@ static int lt8912_bridge_attach(struct d
 	if (ret)
 		goto error;
 
+	ret = lt8912_attach_dsi(lt);
+	if (ret)
+		goto error;
+
 	return 0;
 
 error:
@@ -726,15 +730,8 @@ static int lt8912_probe(struct i2c_clien
 
 	drm_bridge_add(&lt->bridge);
 
-	ret = lt8912_attach_dsi(lt);
-	if (ret)
-		goto err_attach;
-
 	return 0;
 
-err_attach:
-	drm_bridge_remove(&lt->bridge);
-	lt8912_free_i2c(lt);
 err_i2c:
 	lt8912_put_dt(lt);
 err_dt_parse:


Patches currently in stable-queue which might be from max.oss.09@gmail.com are

queue-5.15/revert-drm-bridge-lt8912b-register-and-attach-our-dsi-device-at-probe.patch
